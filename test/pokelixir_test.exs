defmodule PokelixirTest do
  use ExUnit.Case
  doctest Pokelixir

  test "charizard" do
    Process.sleep(1000)
    if Process.whereis(Pokemon) do
      nil
    else
      Pokelixir.start_link()
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

  test "pikachu" do
    Process.sleep(1000)
    if Process.whereis(Pokemon) do
      nil
    else
      Pokelixir.start_link()
    end

    assert Pokelixir.get("pikachu") == %Pokemon{
             id: 25,
             name: "pikachu",
             hp: 35,
             attack: 55,
             defense: 40,
             special_attack: 50,
             special_defense: 50,
             speed: 90,
             height: 4,
             weight: 60,
             types: ["electric"]
           }
  end

  test "Test for last 20 Pokemon" do
    Process.sleep(1000)
    if Process.whereis(Pokemon) do
      nil
    else
      Pokelixir.start_link()
    end

    assert Pokelixir.all("https://pokeapi.co/api/v2/pokemon/?offset=1284&limit=20", []) == [
      [
        %Pokemon{
          id: 10279,
          name: "jellicent-female",
          hp: nil,
          attack: nil,
          defense: nil,
          special_attack: nil,
          special_defense: nil,
          speed: nil,
          height: 22,
          weight: 1350,
          types: []
        },
        %Pokemon{
          id: 10278,
          name: "frillish-female",
          hp: nil,
          attack: nil,
          defense: nil,
          special_attack: nil,
          special_defense: nil,
          speed: nil,
          height: 12,
          weight: 330,
          types: []
        },
        %Pokemon{
          id: 10277,
          name: "terapagos-stellar",
          hp: 160,
          attack: 105,
          defense: 110,
          special_attack: 130,
          special_defense: 110,
          speed: 85,
          height: 17,
          weight: 770,
          types: ["normal"]
        },
        %Pokemon{
          id: 10276,
          name: "terapagos-terastal",
          hp: 95,
          attack: 95,
          defense: 110,
          special_attack: 105,
          special_defense: 110,
          speed: 85,
          height: 3,
          weight: 160,
          types: ["normal"]
        },
        %Pokemon{
          id: 10275,
          name: "ogerpon-cornerstone-mask",
          hp: 80,
          attack: 120,
          defense: 84,
          special_attack: 60,
          special_defense: 96,
          speed: 110,
          height: 12,
          weight: 398,
          types: ["grass", "rock"]
        },
        %Pokemon{
          id: 10274,
          name: "ogerpon-hearthflame-mask",
          hp: 80,
          attack: 120,
          defense: 84,
          special_attack: 60,
          special_defense: 96,
          speed: 110,
          height: 12,
          weight: 398,
          types: ["grass", "fire"]
        },
        %Pokemon{
          id: 10273,
          name: "ogerpon-wellspring-mask",
          hp: 80,
          attack: 120,
          defense: 84,
          special_attack: 60,
          special_defense: 96,
          speed: 110,
          height: 12,
          weight: 398,
          types: ["grass", "water"]
        },
        %Pokemon{
          id: 10272,
          name: "ursaluna-bloodmoon",
          hp: 113,
          attack: 70,
          defense: 120,
          special_attack: 135,
          special_defense: 65,
          speed: 52,
          height: 24,
          weight: 2900,
          types: ["ground", "normal"]
        },
        %Pokemon{
          id: 10271,
          name: "miraidon-glide-mode",
          hp: 100,
          attack: 85,
          defense: 100,
          special_attack: 135,
          special_defense: 115,
          speed: 135,
          height: 28,
          weight: 2400,
          types: ["electric", "dragon"]
        },
        %Pokemon{
          id: 10270,
          name: "miraidon-aquatic-mode",
          hp: 100,
          attack: 85,
          defense: 100,
          special_attack: 135,
          special_defense: 115,
          speed: 135,
          height: 28,
          weight: 2400,
          types: ["electric", "dragon"]
        },
        %Pokemon{
          id: 10269,
          name: "miraidon-drive-mode",
          hp: 100,
          attack: 85,
          defense: 100,
          special_attack: 135,
          special_defense: 115,
          speed: 135,
          height: 28,
          weight: 2400,
          types: ["electric", "dragon"]
        },
        %Pokemon{
          id: 10268,
          name: "miraidon-low-power-mode",
          hp: 100,
          attack: 85,
          defense: 100,
          special_attack: 135,
          special_defense: 115,
          speed: 135,
          height: 28,
          weight: 2400,
          types: ["electric", "dragon"]
        },
        %Pokemon{
          id: 10267,
          name: "koraidon-gliding-build",
          hp: 100,
          attack: 135,
          defense: 115,
          special_attack: 85,
          special_defense: 100,
          speed: 135,
          height: 35,
          weight: 3030,
          types: ["fighting", "dragon"]
        },
        %Pokemon{
          id: 10266,
          name: "koraidon-swimming-build",
          hp: 100,
          attack: 135,
          defense: 115,
          special_attack: 85,
          special_defense: 100,
          speed: 135,
          height: 35,
          weight: 3030,
          types: ["fighting", "dragon"]
        },
        %Pokemon{
          id: 10265,
          name: "koraidon-sprinting-build",
          hp: 100,
          attack: 135,
          defense: 115,
          special_attack: 85,
          special_defense: 100,
          speed: 135,
          height: 35,
          weight: 3030,
          types: ["fighting", "dragon"]
        },
        %Pokemon{
          id: 10264,
          name: "koraidon-limited-build",
          hp: 100,
          attack: 135,
          defense: 115,
          special_attack: 85,
          special_defense: 100,
          speed: 135,
          height: 35,
          weight: 3030,
          types: ["fighting", "dragon"]
        },
        %Pokemon{
          id: 10263,
          name: "gimmighoul-roaming",
          hp: 45,
          attack: 30,
          defense: 25,
          special_attack: 75,
          special_defense: 45,
          speed: 80,
          height: 1,
          weight: 10,
          types: ["ghost"]
        },
        %Pokemon{
          id: 10262,
          name: "squawkabilly-white-plumage",
          hp: 82,
          attack: 96,
          defense: 51,
          special_attack: 45,
          special_defense: 51,
          speed: 92,
          height: 6,
          weight: 24,
          types: ["normal", "flying"]
        },
        %Pokemon{
          id: 10261,
          name: "squawkabilly-yellow-plumage",
          hp: 82,
          attack: 96,
          defense: 51,
          special_attack: 45,
          special_defense: 51,
          speed: 92,
          height: 6,
          weight: 24,
          types: ["normal", "flying"]
        },
        %Pokemon{
          id: 10260,
          name: "squawkabilly-blue-plumage",
          hp: 82,
          attack: 96,
          defense: 51,
          special_attack: 45,
          special_defense: 51,
          speed: 92,
          height: 6,
          weight: 24,
          types: ["normal", "flying"]
        }
      ]
    ]
  end
end
