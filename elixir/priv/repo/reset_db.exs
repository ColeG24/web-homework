# Script for resetting the database. Will delete all entries. You can run it as:
#
#     mix run priv/repo/reset_db.exs
#

alias Homework.Repo
alias Homework.Users.User;

Repo.delete_all(User)