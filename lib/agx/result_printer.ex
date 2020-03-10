defmodule Agx.ResultPrinter do
  alias Agx.Colors
  alias Agx.Term

  def print(matched_lines, term) do
    matched_lines
      |> Enum.each(fn {file, line, index} ->
        around_text = highlight(format_line(line, term), term)

        IO.puts("#{Colors.green(format_file(file))}:#{Colors.blue(index)} -> #{around_text}")
      end)
  end

  defp format_file(file) do
    Path.split(file) |> Enum.join("/")
  end

  defp highlight(line, term) do
    Term.highlight(term, line)
  end

  defp format_line(line, term) do
    if String.length(line) > 77 do
      {index, matched_size} = Term.match(term, line)

      starting = if index - 30 >= 0, do: (index - 30), else: 0
      ending = index + matched_size + 29

      "...#{String.slice(line, starting..ending)}..."
    else
      line
    end
  end
end
