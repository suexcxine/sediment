defmodule Sediment.Router do
  use Sediment.Web, :router

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

  scope "/", Sediment do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    get  "/notebooks", NotebookController, :index
    post "/notebooks", NotebookController, :create
    put    "/notebooks/:notebook_id", NotebookController, :update
    delete "/notebooks/:notebook_id", NotebookController, :delete

    get  "/notes", NoteController, :index
    post "/notes", NoteController, :create
    put    "/notes/:note_id", NoteController, :update
    delete "/notes/:note_id", NoteController, :delete

    get  "/tasks", TaskController, :index
    post "/tasks", TaskController, :create
    put    "/tasks/:note_id", TaskController, :update
    delete "/tasks/:note_id", TaskController, :delete
  end

  # Other scopes may use custom stacks.
  scope "/api", Sediment do
    pipe_through :api

    post "/notebooks", NotebookController, :create_api

  end
end
