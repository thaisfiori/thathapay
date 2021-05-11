defmodule ThathapayWeb.AccounstsController do

  use ThathapayWeb, :controller

  alias Thathapay.Account

  action_fallback ThathapayWeb.FallbackController

  def deposit(conn, params) do
    with {:ok, %Account{} = account} <- Thathapay.deposit(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", account: account)
    end
  end
end
