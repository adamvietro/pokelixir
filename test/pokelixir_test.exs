defmodule PokelixirTest do
  use ExUnit.Case
  doctest Pokelixir

  test "charizard" do
    started = Process.whereis(Pokemon)
    IO.inspect(started)

    if started == nil do
      Pokelixir.start_link()
    else
      IO.inspect("already started")
    end

    assert Pokelixir.get("charizard") == %Pokemon{
             id: 6,
             name: "charizard",
             hp: 78,
             attack: 84,
             defense: 78,
             special_attack: 109,
             special_defense: 85,
             speed: 100,
             height: 17,
             weight: 905,
             types: ["fire", "flying"]
           }
  end

  # test "ditto" do
  #   started = Process.whereis(Pokemon)
  #   IO.inspect(started)

  #   if started == nil do
  #     Pokelixir.start_link()
  #   else
  #     IO.inspect("already started")
  #   end

  #   assert Pokelixir.get("ditto") == %Pokemon{
  #            id: 132,
  #            name: "ditto",
  #            hp: 48,
  #            attack: 48,
  #            defense: 48,
  #            special_attack: 48,
  #            special_defense: 48,
  #            speed: 48,
  #            height: 3,
  #            weight: 40,
  #            types: ["normal"]
  #          }
  # end
end
