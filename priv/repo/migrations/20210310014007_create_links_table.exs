defmodule ExmallUrl.Repo.Migrations.CreateLinksTable do
  use Ecto.Migration

  def change do
    create table(:links) do
      add(:path, :string)
      add(:user_id, references(:users, type: :binary_id, null: true))

      timestamps()
    end

    create(unique_index(:links, [:path]))
  end
end
