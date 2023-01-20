defmodule BlogPhx2.AdminsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `BlogPhx2.Admins` context.
  """

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        avatar: "some avatar",
        body: "some body",
        title: "some title"
      })
      |> BlogPhx2.Admins.create_post()

    post
  end
end
