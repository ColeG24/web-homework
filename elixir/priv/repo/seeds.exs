# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Homework.Repo.insert!(%Homework.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Homework.Repo
alias Homework.Users.User;
alias Homework.Merchants.Merchant;
alias Homework.Transactions.Transaction;



Repo.insert!(
  %User{
    dob: "05/08/1995",
    first_name: "Cole",
    last_name: "Gordon"
  }
)

Repo.insert!(
  %User{
    dob: "07/11/2004",
    first_name: "Some",
    last_name: "Guy"
  }
)


Repo.insert!(
  %User{
    dob: "11/11/1990",
    first_name: "Steve",
    last_name: "McGee"
  }
)

Repo.insert!(
  %User{
    dob: "01/02/1940",
    first_name: "Gandalf",
    last_name: "Grey"
  }
)

Repo.insert!(
  %User{
    dob: "03/05/1960",
    first_name: "Frodo",
    last_name: "Baggins"
  }
)

Repo.insert!(
  %User{
    dob: "05/09/1960",
    first_name: "Samwise",
    last_name: "Gamgee"
  }
)

Repo.insert!(
  %Merchant{
    description: "A merchant",
    name: "Merchant1"
  }
)

Repo.insert!(
  %Merchant{
    description: "A merchant",
    name: "Merchant2"
  }
)

Repo.insert!(
  %Merchant{
    description: "Finest crafted jewelery, imported from middle earth",
    name: "Gandalf's Jewelery"
  }
)

frodoUser = Repo.get_by(User, first_name: "Frodo")

gandalfMerch = Repo.get_by(Merchant, name: "Gandalf's Jewelery")


Repo.insert!(
  %Transaction{
    amount: 1000,
    debit: true,
    description: "One Ring to rule them all (Kardashian edition)",
    user_id: frodoUser.id,
    merchant_id: gandalfMerch.id
  }
)