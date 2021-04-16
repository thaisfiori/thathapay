defmodule Thathapay.Users.Create do
  alias Thathapay.{Repo, User}

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
