defmodule Homework.Paging.Paging do
  @moduledoc false
  import Ecto.Query, warn: false

  alias Homework.Repo

  def paginate(baseQuery, limit, skip) do
    count_query = from r in subquery(baseQuery), select: count(r.id)
    count_res = Repo.one(count_query)

    paged_query = from r in subquery(baseQuery), limit: ^limit, offset: ^skip, order_by: r.inserted_at
    results = Repo.all(paged_query)
    %{items: results, total_rows: count_res}
    end

  def paginate(baseQuery, args) do
    case args do
      %{:limit => limit, :skip => skip} ->
        paginate(baseQuery, limit, skip)
      # Should handle other cases and return error or have default values
    end
  end
end