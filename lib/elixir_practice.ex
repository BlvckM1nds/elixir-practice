defmodule ElixirPractice do
  use Application

  def start(_type, _args) do
    ElixirPractice.main()
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def main do
    # memberships = {:bronze, :silver}
    # memberships = Tuple.append(memberships, :gold)
    # IO.inspect(memberships)

    # prices = {5, 10, 15}
    # avg = Tuple.sum(prices) / tuple_size(prices)

    # IO.puts(
    #   "The average from #{elem(prices, 0)}, #{elem(prices, 1)}, and #{elem(prices, 2)} is #{avg}"
    # )

    memberships = %{

    }

    users = [
      {"Caleb", :gold},
      {"John", :silver},
      {"Daphne", :bronze}
    ]

    Enum.each(users, fn {n, m} ->
      IO.puts("#{n} has #{m} membership")
    end)

    # user = {"Caleb", elem(memberships, 2)}
    # IO.inspect(user)
    # {name, membership} = user
    # IO.puts("#{name} has #{membership} membership")
  end
end
