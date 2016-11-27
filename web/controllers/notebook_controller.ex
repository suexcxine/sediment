defmodule Sediment.NotebookController do
  use Sediment.Web, :controller

  def index(conn, _params) do
    text conn, "caonima"
  end

  def create(conn, _params) do
    text conn, "caonima"
  end

  def create_api(conn, _params) do
    json conn, %{cao: "hahahahaah"}
  end
end

