defmodule Structs do
  defmodule Membership do
    defstruct [:type, :price]
  end

  defmodule User do
    defstruct [:name, :membership]
  end
end
