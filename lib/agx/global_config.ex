defmodule Agx.GlobalConfig do
  def read(profile) do
    initialize()

    { configs, _} = "#{System.get_env("HOME")}/.agx.exs"
      |> File.read!
      |> Code.eval_string

    Map.get(configs, String.to_atom(profile))
  end

  defp initialize do
    if !File.exists?("#{System.get_env("HOME")}/.agx.exs") do
      File.write!("#{System.get_env("HOME")}/.agx.exs", basic_template())
    end
  end

  defp basic_template do
    # default global config is adapted to rails and elixir mix projects
    """
    %{
      default: %{
        allowed_extentions: [
          "rb",
          "ex",
          "iex",
          "html",
          "erb",
          "yml",
          "js",
          "jsx",
          "ts",
          "tsx",
          "css",
          "txt"
        ],
        ignored_folders: [
          "tmp",
          "log",
          "vendor",
          "public",
          "_build",
          "cover",
          "docs",
          "deps",
          ".git",
          ".next"
        ]
      }
    }
    """
  end
end
