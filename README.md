# Pokelixir

**TODO: Add async to help overall time for the total pokemon list.**

This was a great project to learn about Finch and APIs. Once I was able to understand how to parse the JSON I was able to really move fast to finished gathering and created the maps for individual or all the Pokemon. Be sure when building your own Pokemon API to watch out for single key pairs or lists of Key pairs.

You have 2 option for running the program. 

1) I created an executable that will initialize the Finch link and ask the user for input.

Simply ./pokelixir and follow the instructions.

2) You can run 'iex -S mix" 
You must then run 'Pokelixir.start_link()
to create the link
the run either `Pokelixir.get("pokemon_name")
where "pokemon_name" is the name of the Pokemon you want to look up.
or run 'Pokelixir.all()' 
to get a list of every Pokemon.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `pokelixir` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:pokelixir, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/pokelixir>.

