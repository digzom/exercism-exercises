defmodule NameBadge do
  @separator " - "
  @owner_department "OWNER"

  @spec print(id :: non_neg_integer() | nil, name :: String.t(), department :: String.t() | nil) :: String.t()
  def print(id, name, department) do


    id = if id, do: ~s([#{id}])
    dep = if department, do: String.upcase(department), else: @owner_department

    [id, name, dep]
    |> Enum.reject(fn x -> is_nil(x) end)
    |> Enum.join(@separator)
  end
end
