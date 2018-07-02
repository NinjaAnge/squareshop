
defmodule Cart do
  use Ecto.Schema
  import Ecto.Changeset

  embedded_schema do
	  field :product_id, :integer
	  field :amount, :integer
  end


  def changeset(item, attrs) do
	  # Logger.debug("user #{inspect(user)}")
	  Logger.debug("number 1 ran")
	  item
	  |> cast(attrs, [:product_id, :amount])
	  |> validate_required([:product_id, :amount])

  end
end
