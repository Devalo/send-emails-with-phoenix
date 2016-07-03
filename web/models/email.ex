defmodule Emailapp.Email do
  use Emailapp.Web, :model

  schema "emails" do
    field :recipient, :string
    field :subject, :string
    field :content, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:recipient, :subject, :content])
    |> validate_required([:recipient, :subject, :content])
  end
end
