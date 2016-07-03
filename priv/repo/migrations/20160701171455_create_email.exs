defmodule Emailapp.Repo.Migrations.CreateEmail do
  use Ecto.Migration

  def change do
    create table(:emails) do
      add :recipient, :string
      add :subject, :string
      add :content, :text

      timestamps()
    end

  end
end
