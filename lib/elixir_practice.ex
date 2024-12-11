defmodule ElixirPractice do
  use Application

  alias Structs.{Membership, User}

  def start(_type, _args) do
    ElixirPractice.main()
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def print_numbers(numbers) do
    numbers |> Enum.join(" ") |> IO.puts()
  end

  def main do
    memberships = {:bronze, :silver}
    memberships = Tuple.append(memberships, :gold)
    IO.inspect(memberships)

    prices = {5, 10, 15}
    avg = Tuple.sum(prices) / tuple_size(prices)

    IO.puts(
      "The average from #{elem(prices, 0)}, #{elem(prices, 1)}, and #{elem(prices, 2)} is #{avg}"
    )

    gold_membership = %Membership{type: :gold, price: 25}
    silver_membership = %Membership{type: :silver, price: 15}
    bronze_membership = %Membership{type: :bronze, price: 5}
    none_membership = %Membership{type: :none, price: 0}

    users = [
      %User{name: "Caleb", membership: gold_membership},
      %User{name: "Rebecca", membership: silver_membership},
      %User{name: "Ryu", membership: bronze_membership},
      %User{name: "Daphne", membership: none_membership}
    ]

    result = Enum.map(users, fn %User{name: _n, membership: m} -> m end)
    IO.inspect(result)

    Enum.each(users, fn %User{name: n, membership: m} ->
      # IO.puts("#{n} has #{m} membership#{if m > 1, do: "s", else: ""}")
      IO.puts("#{n} has #{m.type} membership paying #{m.price}")
    end)

    # correct = :rand.uniform(11) - 1
    # IO.puts(correct)
    # guess = IO.gets("Guess a number from 0-10: ") |> String.trim() |> Integer.parse()

    # case guess do
    #   {res, _} ->
    #     IO.puts("parse successful #{res}")

    #     if res == correct do
    #       IO.puts("you win!")
    #     else
    #       IO.puts("you lose!")
    #     end

    #   :error ->
    #     IO.puts("something went wrong")
    # end

    # # LIST
    # grades = [25, 50, 75, 100]
    # new = for n <- grades, do: Integer.pow(n, 2)
    # IO.inspect(new)
    # new = new ++ [Integer.pow(125, 2), 1, 1, 23, 2, 4, 14, 14]
    # IO.inspect(new)
    # final = [6777, 249182 | new]
    # IO.inspect(final)
    # even = for n <- final, Integer.is_even(n), do: n
    # IO.inspect(even)

    # FUNCTIONAL PROGRAMMING
    # result = Enum.map(%User{name: n, membership: m}, &(&1))
    # print_numbers(result)

    # user = {"Caleb", elem(memberships, 2)}
    # IO.inspect(user)
    # {name, membership} = user
    # IO.puts("#{name} has #{membership} membership")
  end
end
