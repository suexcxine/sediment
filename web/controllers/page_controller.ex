defmodule Sediment.PageController do
  use Sediment.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
