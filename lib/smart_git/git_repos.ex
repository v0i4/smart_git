defmodule SmartGit.GitRepos do
  alias SmartGit.GitRepos.GitRepo
  alias SmartGit.Repo

  def create(repo) do
    %GitRepo{}
    |> GitRepo.changeset(repo)
    |> Repo.insert()
  end
end
