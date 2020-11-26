defmodule Agx.Scanner do
  alias Agx.Term

  def generate(files, term) do
    files
      |> Enum.map(fn file ->
        file
          |> File.read!
          |> String.split("\n")
          |> Enum.with_index(1)
          |> Enum.filter(fn {line, _index} -> Term.match?(term,  line) end)
          |> Enum.map(fn {line, index} -> {file, line, index} end)
      end)
      |> List.flatten
      |> Enum.map(fn {file, line, index} -> {file, line, index} end)
  end
end
