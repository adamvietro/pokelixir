defmodule Pokelixir do
  @moduledoc """
  Documentation for `Pokelixir`.
  """

  @doc """
  Creates a map of all the Pokemon stats.
  """
  def stat_map(stats) do
    Enum.reduce(stats, %{}, fn stat, acc ->
      value = stat["base_stat"]
      name = stat["stat"]["name"]
      Map.put_new(acc, name, value)
    end)
  end

  @doc """
  Creates a list of types for a Pokemon.
  """
  def types(types) do
    Enum.map(types, fn type ->
      type["type"]["name"]
    end)
  end

  @doc """
  Decodes a JSON data set into an Elixir map.
  """
  def jason_decode(response) do
    body = response.body
    Jason.decode!(body)
  end

  @doc """
  Builds and decodes the body for a single Pokemon
  """
  def build_decode_pokemon(pokemon) do
    {:ok, response} =
      Finch.build(:get, "https://pokeapi.co/api/v2/pokemon/#{pokemon}")
      |> Finch.request(Pokemon)

    jason_decode(response)
  end

  @doc """
  Builds and decodes the body for a list of Pokemon.
  """
  def build_decode_url(url) do
    {:ok, response} =
      Finch.build(:get, url)
      |> Finch.request(Pokemon)

    body = response.body
    Jason.decode!(body)
  end

  @doc """
  Takes a list of Pokemon maps creates a list of structs for each Pokemon.
  """
  def poke_list(pokemon_list) do
    Enum.reduce(pokemon_list, [], fn pokemon, acc ->
      struct = get(pokemon["name"])
      [struct | acc]
    end)
  end

  @doc """
  Takes a Pokemon name and creates a struct with all the important information.
  """
  def get(pokemon) do
    decoded = build_decode_pokemon(pokemon)
    stat_map = stat_map(decoded["stats"])
    types_list = types(decoded["types"])

    %Pokemon{
      id: decoded["id"],
      name: decoded["name"],
      hp: stat_map["hp"],
      attack: stat_map["attack"],
      defense: stat_map["defense"],
      special_attack: stat_map["special-attack"],
      special_defense: stat_map["special-defense"],
      speed: stat_map["speed"],
      height: decoded["height"],
      weight: decoded["weight"],
      types: types_list
    }
  end

  @doc """
  Pulls the first 20 Pokemon and sets the next request for subsequent requests.

  Also builds the list of the first 20 Pokemon structs.
  """
  def all(first \\ "https://pokeapi.co/api/v2/pokemon/") do
    decoded = build_decode_url(first)

    IO.inspect("first 20")
    next_set = decoded["next"]
    pokemon = decoded["results"]

    pokemon_list = poke_list(pokemon)
    all(next_set, pokemon_list)
  end

  @doc """
  Recursively calls and build the Pokemon struct 20 at a time.
  """
  def all(next_set, poke_list) do
    decoded = build_decode_url(next_set)

    IO.inspect("next 20")
    next_set = decoded["next"]
    pokemon = decoded["results"]

    new_list = poke_list(pokemon)
    list = [new_list | poke_list]

    if next_set == nil do
      list
    else
      all(next_set, list)
    end
  end

  @doc """
  Used to create the Finch request and start the Supervisor for the process.
  """
  def start_link() do
    children = [
      {Finch, name: Pokemon}
    ]

    Supervisor.start_link(children, strategy: :one_for_one)

    Finch.start_link(name: Pokemon)
  end

  @doc """
  Used to create an other child that has a different name from Pokemon. Might be used later for Async.
  """
  def start_link(named) do
    children = [
      {Finch, name: named}
    ]

    Supervisor.start_link(children, strategy: :one_for_one)

    Finch.start_link(name: named)
  end

end
