defmodule MjmlDemoWeb.PageController do
  use MjmlDemoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
