defmodule Main do
  @moduledoc """
  This is the module for the executable and the user interface.
  """

  def user_input() do
    IO.gets(
      "\nPlease enter a valid Pokemon name,\n\"all\" for the entire list. \n\"stop\" to exit.\n"
    )
    |> String.trim()
  end

  def user_loop(input) do
    cond do
      input == "all" -> IO.inspect(Pokelixir.all())
      input == "stop" -> IO.puts("Thanks for stopping by.")
      true -> IO.inspect(Pokelixir.get(input))
        user_loop(user_input())

    end
  end

  def main(_args) do
    IO.puts(
      "Welcome to the Pokemon Pokelixir API. \nYou can requests every Pokemon or call for single pokemon at at time"
    )

    IO.puts("Starting the link...")
    Pokelixir.start_link()
    IO.puts("Link started...")

    input = user_input()
    user_loop(input)
  end
end
