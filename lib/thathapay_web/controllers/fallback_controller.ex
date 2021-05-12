defmodule ThathapayWeb.FallbackController do

  use ThathapayWeb, :controller

  def call(conn, {:error, result}) do
    conn
    |> put_status(:bad_request)
    |> put_view(ThathapayWeb.ErrorView)
    |> render("400.json", result: result)
  end

end
