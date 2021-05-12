defmodule ThathapayWeb.UsersController do
  use ThathapayWeb, :controller

  alias Thathapay.User

  action_fallback ThathapayWeb.FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Thathapay.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end
end
