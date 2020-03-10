# Agx (simple and extensible string finder)

Agx is a tool to provide simple string finding like `ag` but 
powerfull but simpler and already adapted to several project archtypes.

## Installation

Just download the binary in `bin/agx` and add it to the path

```shell
wget https://raw.githubusercontent.com/andrewaguiar/agx/master/bin/agx
chmod +x agx
```

Or clone the project and make the binary

```shell
git clone git@github.com:andrewaguiar/agx.git
cd agx
mix escript.build
```

Then add it to PATH

```shell
export PATH="$PATH:agx_location"
```

## Usage

Type `agx` to see instructions.

```shell
NAME
       agx - Simple and powerfull string searcher.

SYNOPSIS
       agx <term> [base-path] [-xarp]

DESCRIPTION
       Agx scans all allowed files recursively and shows all occurences of <string-to-be-replaced> in each file, then it
       asks for confirmation before replace all occurrences by <replacement>.

       The following options are available:

       --ext | -x
              The file extentions (comma separated) allowed to be analyzed (default see `~/.agx.iex`).

       --regex | -r
              Treats the <string-to-be-replaced> as a regex instead of a simple text (default false).

       --profile | -p
              Uses an specific profile configured in ~/.agx.exs (default :default).

PROFILES
       First time you run Agx it will create the global config file in HOME called ~/.agx.exs,
       Agx uses this global configuration file named ~/.agx.exs to configure 2 basic stuff.

       1. The allowed extentions and.
       2. Ignored folders during the scan.

       When you don't pass --profile|-p argument it with use the :default profile defined in ~/.agx.exs,
       You can as many different profiles you want in the ~/.agx.exs file as a ordinary elixir code (a Map structure)
       following the template:

              profile_name: %{
                allowed_extentions: List,
                ignored_folders: List
              }

       Or you can simply modify the default profile :default =)
```

### Creating a bin

run `./make_dist` and the binary will be generated in `./bin`.
