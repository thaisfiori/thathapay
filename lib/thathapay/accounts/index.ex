defmodule Thathapay.Account.Index do
  alias Ecto.Multi
  alias Thathapay.{Account, Repo}

  def call(%{"id" => id}) do
    Multi.new()
    |> Multi.run(:account, fn repo, _changes -> get_account(repo, id) end)
    |> run_transaction()
  end

  defp get_account(repo, id) do
    case repo.get(Account, id) do
      nil -> {:error, "Account not found!"}
      account -> {:ok, account}
    end
  end

  defp run_transaction(multi) do
    case Repo.transaction(multi) do
      {:error, _operation, reason, _changes} -> {:error, reason}
      {:ok, %{account: account}} -> {:ok, account}
    end
  end
end
