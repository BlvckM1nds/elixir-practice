defmodule ElixirPractice do
  use Application

  def start(_type, _args) do
    ElixirPractice.main()
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def main do
    x = 5
    IO.puts(x)
  end
end
