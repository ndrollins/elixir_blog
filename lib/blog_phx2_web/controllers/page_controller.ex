defmodule BlogPhx2Web.PageController do
  use BlogPhx2Web, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
