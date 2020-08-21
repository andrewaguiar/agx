defmodule Agx.CLI do
  alias Agx.Colors

  def main(args) do
    args |> parse_args |> run
  end

  defp run({args_config, [term], []}) do
    Agx.run(args_config, term)
  end

  defp run(_) do
    IO.puts(
      """
      #{Colors.bold("NAME")}
             agx - Simple and powerfull string searcher.

      #{Colors.bold("SYNOPSIS")}
             agx <term> [base-path] [-r]

      #{Colors.bold("DESCRIPTION")}
             Agx scans all non gitignore files shows all occurences of <term> in each file.

             The following options are available:

             #{Colors.bold("--regex | -r")}
                    Treats the <string-to-be-replaced> as a regex instead of a simple text (default false).
      """
    )
  end

  defp parse_args(args) do
    switches = [regex: :boolean]
    aliases = [r: :regex]

    OptionParser.parse(args, switches: switches, aliases: aliases)
  end
end
