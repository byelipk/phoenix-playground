defmodule Playground.PageController do
  use Playground.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def downloads(conn, _params) do
    render conn, "downloads.html"
  end

  def download(conn, %{"id" => "text"}) do
    text conn, "Hey there"
  end

  def download(conn, %{"id" => "json"}) do
    json conn, %{hello: "world"}
  end

  def download(conn, %{"id" => "html"}) do
    html conn, "<html><body><h1>HELLO</h1><body></html>"
  end

  def download(conn, %{"id" => "binary"}) do
    send_file conn, 200, pdf_path()
  end

  def download(conn, %{"id" => "download"}) do
    send_download conn, {:file, pdf_path()}, filename: "hello.pdf"
  end

  def download(conn, %{"id" => "render"}) do
    render conn, "download.html", pdf_path: pdf_path()
  end

  defp pdf_path() do
    Application.app_dir(:playground, "priv/hello.pdf")
  end
end
