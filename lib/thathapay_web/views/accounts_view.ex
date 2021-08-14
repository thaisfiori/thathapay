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

  def render("status.json", %{
        account: %Account{id: account_id, balance: balance}
      }) do
    %{
      message: "This is the account balance!",
      account: %{
        id: account_id,
        balance: balance
      }
    }
  end

  def render("transfer.json", %{
        account: %Account{id: account_id, balance: balance}
      }) do
    %{
      message: "Transfer completed!",
      account: %{
        id: account_id,
        balance: balance
      }
    }
  end
end
