defmodule ThathapayWeb.UsersView do
  alias Thathapay.{Account, User}

  def render("create.json", %{
        user: %User{
          account: %Account{id: account_id, balance: balance},
          id: id,
          name: name,
          nickname: nickname
        }
      }) do
    %{
      message: "User created",
      user: %{
        id: id,
        name: name,
        nickname: nickname,
        account: %{
          id: account_id,
          balance: balance
        }
      }
    }
  end

  def render("index.json", %{account: %Account{id: account_id, balance: balance}}) do
    %{
      message: "This is your account status!",
      account: %{
        id: account_id,
        balance: balance
      }
    }
  end
end

# def render("update.json", %{
#       user: %User{
#         account: %Account{id: account_id, balance: balance}
#         # id: id,
#         # name: name,
#         # nickname: nickname
#       }
#     }) do
#   %{
#     message: "Transaction completed!",
#     user: %{
#       # id: id,
#       # name: name,
#       # nickname: nickname,
#       account: %{
#         id: account_id,
#         balance: balance
#       }
#     }
#   }
# end
# end
