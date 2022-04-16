defmodule SmartGit.GitRepos do
  import Ecto.Query
  alias SmartGit.GitRepos.GitRepo
  alias SmartGit.Repo

  def create(repo) do
    %GitRepo{}
    |> GitRepo.changeset(repo)
    |> Repo.insert()
  end

  def all, do: GitRepo |> Repo.all()

  def get_saved_repos do
    GitRepo
    |> select([g], g.git_id)
    |> Repo.all()
  end

  def get_by_git_id(id) do
    Repo.get_by(GitRepo, git_id: id)
  end
end
