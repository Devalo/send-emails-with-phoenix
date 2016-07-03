defmodule Emailapp.PageController do
  use Emailapp.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
