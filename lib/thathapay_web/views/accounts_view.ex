defmodule ThathapayWeb.AccountsView do
  alias Thathapay.{Account}

  def render("update.json", %{
        account: %Account{id: account_id, balance: balance}
      }) do
    %{
      message: "Transaction completed!",
      account: %{
        id: account_id,
        balance: balance
      }
    }
  end
end
