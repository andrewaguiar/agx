defmodule Agx.Searcher do
  def find() do
    System.cmd("git", ["ls-files"])
    |> handle
  end

  defp handle({result, 0}) do
    result
    |> String.split("\n")
    |> Enum.reject(fn s -> s == "" end)
    |> Enum.filter(fn file -> valid_file?(file) end)
  end

  defp handle({"", 128}) do
    IO.puts("PWD is not a git controlled folder")

    System.halt(1)
  end

  defp handle({_, 1}) do
    IO.puts("git ls-files command not found")

    System.halt(1)
  end

  defp valid_file?(file) do
    case File.read(file) do
      {:error, :enoent} ->
        false
      {:ok, file_content} ->
        String.valid?(file_content) && !String.contains?(file_content, <<0>>)
    end
  end
end
