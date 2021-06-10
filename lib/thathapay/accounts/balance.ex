defmodule Thathapay.Account.Balance do
  alias Thathapay.{Account, Repo, User}

  def call(%{"global_id" => id}) do
    id
    |> get_account()
  end

  defp get_account(id) do
    case Repo.get(Account, id) do
      nil -> get_account(:not_account, id)
      account -> {:ok, account}
    end
  end

  defp get_account(:not_account, id) do
    case Repo.get(User, id) do
      nil -> {:error, "Account not found"}
      user -> {:ok, user}
    end
  end
end
