defmodule Agx.Summarizer do
  alias Agx.Colors

  def print(matched_lines) do
    total_lines = matched_lines
      |> length

    total_files = matched_lines
      |> Enum.map(fn {file, _, _} -> file end)
      |> Enum.uniq
      |> length

    IO.puts(
      "\n#{Colors.green(total_files)} files and #{Colors.green(total_lines)} " <>
      "lines found\n"
    )
  end
end
