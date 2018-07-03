defmodule Squareshop.Sales do
	#importing functions
		require Stripe
		import Ecto.Query
	#Setting up aliases
		alias Squareshop.Repo
		alias Squareshop.Sales
		alias Squareshop.Sales.Orders
		alias Squareshop.Sales.Cart
		alias Squareshop.Identity
		alias Squareshop.Products
		alias Stripe
		alias Stripe.Charge
		alias Squareshop.Identity

# cart functions
	defp cartitem([head | tail], param) do
		cond do
		head.product_id == param.product_id ->
			%{ok: head.amount + param.amount}
		true ->
			cartitem(tail, param)
		end
	end
	defp cartitem([], param) do
		%{error: param}
	end

	def add_to_cart(id, param) do
		user = Identity.get_user!(id)
		user.shopping_cart
		|> cartitem(param)
		# |> Cart.changeset(%Cart{})
	end

#cart functions end


	def stripetest do
		 # obtained with Stripe.js
		Stripe.Charge.create(%{amount: 2000, currency: "nok", source: "tok_mastercard", description: "Charge for madison.anderson@example.com"})
	end

	def create_order(user_id, card) do
		user = Identity.get_user!(user_id)

		# for product <= user.shopping_cart do
		# Products.get_product!()
		# end



		Stripe.Charge.create(card)
	end
end
