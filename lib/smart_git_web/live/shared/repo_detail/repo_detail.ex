defmodule SmartGitWeb.Shared.RepoDetail do
  use SmartGitWeb, :live_component
  alias SmartGit.GitRepos

  def update(%{saved_repos: nil} = assigns, socket) do
    socket = socket |> assign_default(assigns) |> assign(icon: "go.html")
    {:ok, socket}
  end

  def update(%{id: id, saved_repos: saved_repos} = assigns, socket) do
    socket = socket |> assign_default(assigns) |> choose_icon(id, saved_repos)
    {:ok, socket |> assign_default(assigns)}
  end

  defp assign_default(socket, %{repo: repo, id: id}) do
    assign(socket, repo: repo, id: id, message: nil)
  end

  def handle_event("add-repo", _params, socket) do
    icon = socket.assigns.icon
    repo = socket.assigns.repo

    if icon == "add.html" do
      repo = socket.assigns.repo
      GitRepos.create(repo)
      message = (socket.assigns.message == nil && "repo added!") || nil
      {:noreply, assign(socket, message: message, icon: "go.html")}
    else
      socket = push_redirect(socket, to: Routes.show_repo_path(socket, :index, repo.git_id))
    end
  end

  defp choose_icon(socket, id, saved_repos) do
    {id, _} = Integer.parse(id)

    case id in saved_repos do
      true -> assign(socket, icon: "go.html")
      false -> assign(socket, icon: "add.html")
    end
  end
end
