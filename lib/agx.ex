defmodule Agx do
  alias Agx.Scanner
  alias Agx.ResultPrinter
  alias Agx.Summarizer
  alias Agx.Searcher

  def run(args_config, term_string) do
    term = %Agx.Term{value: term_string, regex: args_config[:regex] != nil}

    all_files = Searcher.find()

    matched_lines = Scanner.generate(all_files, term)

    ResultPrinter.print(matched_lines, term)

    Summarizer.print(matched_lines)
  end
end
