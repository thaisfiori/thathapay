defmodule Thathapay do
  @moduledoc """
  Thathapay keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  alias Thathapay.Users.Create, as: UserCreate
  alias Thathapay.Account.{Balance, Deposit, Transfer, Withdraw}

  defdelegate create_user(params), to: UserCreate, as: :call

  defdelegate deposit(params), to: Deposit, as: :call
  defdelegate withdraw(params), to: Withdraw, as: :call
  defdelegate balance(params), to: Balance, as: :call
  defdelegate transfer(params), to: Transfer, as: :call
end
