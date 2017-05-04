defmodule Playground.Router do
  use Playground.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Playground do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    get "/downloads",     PageController, :downloads
    get "/downloads/:id", PageController, :download
  end

  # Other scopes may use custom stacks.
  # scope "/api", Playground do
  #   pipe_through :api
  # end
end
