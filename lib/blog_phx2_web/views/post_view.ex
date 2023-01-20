defmodule BlogPhx2Web.PostView do
  use BlogPhx2Web, :view

  def fetch_date(input) do
    [date, time] = input |> to_string |> String.split(" ")
    date
  end

  def url_generator(input) do
    [name, file_type] = input |> String.split(".", trim: true)
    name
  end
end
