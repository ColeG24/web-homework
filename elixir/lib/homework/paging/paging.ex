defmodule Homework.Paging.Paging do
  @moduledoc false
  import Ecto.Query, warn: false

  alias Homework.Repo

  def paginate(baseQuery, limit, skip) do
    countQuery = from r in subquery(baseQuery), select: count(r.id)
    countRes = Repo.one(countQuery)

    pagedQuery = from r in subquery(baseQuery), limit: ^limit, offset: ^skip, order_by: r.inserted_at
    results = Repo.all(pagedQuery)
    IO.inspect(countRes)
    %{items: results, total: countRes}
    end

  def paginate(baseQuery, args) do
    case args do
      %{:limit => limit, :skip => skip} ->
        paginate(baseQuery, limit, skip)
    end
  end
end