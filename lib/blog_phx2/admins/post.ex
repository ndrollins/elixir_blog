defmodule BlogPhx2.Admins.Post do
  use Ecto.Schema
  import Ecto.Changeset
  use Arc.Ecto.Schema

  schema "posts" do
    field :avatar, BlogPhx2.Avatar.Type
    field :body, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :body])
    |> cast_attachments(attrs, [:avatar])
    |> validate_required([:title, :body, :avatar])
  end
end
