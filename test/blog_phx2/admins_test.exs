defmodule BlogPhx2.AdminsTest do
  use BlogPhx2.DataCase

  alias BlogPhx2.Admins

  describe "posts" do
    alias BlogPhx2.Admins.Post

    import BlogPhx2.AdminsFixtures

    @invalid_attrs %{avatar: nil, body: nil, title: nil}

    test "list_posts/0 returns all posts" do
      post = post_fixture()
      assert Admins.list_posts() == [post]
    end

    test "get_post!/1 returns the post with given id" do
      post = post_fixture()
      assert Admins.get_post!(post.id) == post
    end

    test "create_post/1 with valid data creates a post" do
      valid_attrs = %{avatar: "some avatar", body: "some body", title: "some title"}

      assert {:ok, %Post{} = post} = Admins.create_post(valid_attrs)
      assert post.avatar == "some avatar"
      assert post.body == "some body"
      assert post.title == "some title"
    end

    test "create_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Admins.create_post(@invalid_attrs)
    end

    test "update_post/2 with valid data updates the post" do
      post = post_fixture()

      update_attrs = %{
        avatar: "some updated avatar",
        body: "some updated body",
        title: "some updated title"
      }

      assert {:ok, %Post{} = post} = Admins.update_post(post, update_attrs)
      assert post.avatar == "some updated avatar"
      assert post.body == "some updated body"
      assert post.title == "some updated title"
    end

    test "update_post/2 with invalid data returns error changeset" do
      post = post_fixture()
      assert {:error, %Ecto.Changeset{}} = Admins.update_post(post, @invalid_attrs)
      assert post == Admins.get_post!(post.id)
    end

    test "delete_post/1 deletes the post" do
      post = post_fixture()
      assert {:ok, %Post{}} = Admins.delete_post(post)
      assert_raise Ecto.NoResultsError, fn -> Admins.get_post!(post.id) end
    end

    test "change_post/1 returns a post changeset" do
      post = post_fixture()
      assert %Ecto.Changeset{} = Admins.change_post(post)
    end
  end
end
