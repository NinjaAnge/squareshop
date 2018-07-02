defmodule Squareshop.Identity.User do
# adding in needed functions
	use Ecto.Schema
	import Ecto.Changeset
	require Logger
	alias Comeonin.Pbkdf2
	schema "users" do
		field :fname, :string
		field :lname, :string
		field :phone, :string
		field :email, :string
		field :encrypted_password, :string
		field :address, :string
		field :city, :string
    	field :country, :string
    	field :zip_code, :integer
		embeds_many :shopping_cart, Sales.Cart
		timestamps()
	end
	def changeset(user, attrs) do
		# Logger.debug("user #{inspect(user)}")
		Logger.debug("number 1 ran")
		user
		|> cast(attrs, [:fname, :lname, :phone, :email, :encrypted_password, :address, :city, :country, :zip_code])
		|> validate_required([:fname, :lname, :email])
		|> update_change(:encrypted_password, &Pbkdf2.hashpwsalt/1)


	end

end
