defmodule SmartGitWeb.Page.RepoDetail do
  use SmartGitWeb, :live_component
  alias SmartGit.GitRepos

  def update(assigns, socket) do
    {:ok, socket |> assign(assigns) |> assign(message: nil)}
  end

  def handle_event("add-repo", _params, socket) do
    repo = socket.assigns.repo
    GitRepos.create(repo)
    message = (socket.assigns.message == nil && "repo added!") || nil
    {:noreply, assign(socket, message: message)}
  end
end
