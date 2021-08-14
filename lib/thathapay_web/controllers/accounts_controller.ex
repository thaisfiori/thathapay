defmodule ThathapayWeb.AccountsController do
  use ThathapayWeb, :controller

  alias Thathapay.Account

  action_fallback ThathapayWeb.FallbackController

  def deposit(conn, params) do
    with {:ok, %Account{} = account} <- Thathapay.deposit(params) |> IO.inspect() do
      conn
      |> put_status(:ok)
      |> render("update.json", account: account)
    else
      {:error, "Invalid deposit value!"} -> :error
    end
  end

  def withdraw(conn, params) do
    with {:ok, %Account{} = account} <- Thathapay.withdraw(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", account: account)
    end
  end

  def balance(conn, params) do
    with {:ok, %Account{} = account} <- Thathapay.balance(params) do
      conn
      |> put_status(:ok)
      |> render("status.json", account: account)
    end
  end

  def transfer(conn, params) do
    with {:ok, %Account{} = account} <- Thathapay.transfer(params) do
      conn
      |> put_status(:ok)
      |> render("transfer.json", account: account)
    end
  end
end
