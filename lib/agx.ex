defmodule Agx do
  alias Agx.GlobalConfig
  alias Agx.Scanner
  alias Agx.ResultPrinter
  alias Agx.Summarizer
  alias Agx.Searcher

  def run(args_config, term_string, base_path) do
    term = %Agx.Term{value: term_string, regex: args_config[:regex] != nil}

    global_config = GlobalConfig.read(args_config[:profile] || "default")

    all_files = Searcher.find(base_path, args_config, global_config)

    matched_lines = Scanner.generate(all_files, term)

    ResultPrinter.print(matched_lines, term)

    Summarizer.print(base_path, matched_lines, args_config, global_config)
  end
end
