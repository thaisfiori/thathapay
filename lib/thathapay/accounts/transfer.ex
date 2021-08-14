defmodule Thathapay.Account.Transfer do
  alias Thathapay.Account.{Deposit, Withdraw}

  def call(%{"id_from" => id_from, "id_to" => id_to, "value" => value}) do
    with {:ok, account_from} <- Withdraw.call(%{"id" => id_from, "value" => value}),
         {:ok, _account_to} <- Deposit.call(%{"id" => id_to, "value" => value}) do
      {:ok, account_from}
    end
  end
end
