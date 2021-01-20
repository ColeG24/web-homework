defmodule Homework.Transactions.Transaction do
  use Ecto.Schema
  import Ecto.Changeset
  alias Homework.Merchants.Merchant
  alias Homework.Users.User

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "transactions" do
    field(:amount, :integer)
    field(:credit, :boolean, default: false)
    field(:debit, :boolean, default: false)
    field(:description, :string)

    belongs_to(:merchant, Merchant, type: :binary_id, foreign_key: :merchant_id)
    belongs_to(:user, User, type: :binary_id, foreign_key: :user_id)

    timestamps()
  end

  @doc false
  def changeset(transaction, attrs) do
    transaction
    |> cast(attrs, [:user_id, :amount, :credit, :debit, :description, :merchant_id])
    |> validate_required([:user_id, :amount, :description, :merchant_id])
  end

  @doc """
   Converts from cents representation(1048) to decimal (10.48)
  """
  def from_cents(transaction) when is_integer(transaction.amount) do
    amount_to_decimal = transaction.amount / 100
    %{transaction | amount: amount_to_decimal}
  end


  @doc """
   Converts from decimal representation(10.48) to cents (1048)
  """
  def to_cents(transaction) when is_float(transaction.amount) do
    amount_to_cents = round(transaction.amount * 100)

    %{transaction | amount: amount_to_cents}
  end

  def to_cents(transaction) when is_nil(transaction.amount) do
    transaction
  end
end
