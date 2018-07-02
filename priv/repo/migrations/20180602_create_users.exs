defmodule Compare.Repo.Migrations.CreateUsers do
	use Ecto.Migration

	def change do
		create table(:users) do
			add :fname, :string
			add :lname, :string
			add :phone, :string
			add :email, :string
			add :encrypted_password, :string
			add :address, :string
      		add :country, :string
     		add :city, :string
      		add :zip_code, :integer
			add :shopping_cart, {:array, :map}, default: []
			timestamps()
		end
	end

end
