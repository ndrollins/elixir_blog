defmodule BlogPhx2Web.PostController do
  use BlogPhx2Web, :controller

  alias BlogPhx2.Admins
  alias BlogPhx2.Admins.Post

  def index(conn, _params) do
    posts = Admins.list_posts()
    render(conn, "index.html", posts: posts)
  end

  def new(conn, _params) do
    changeset = Admins.change_post(%Post{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"post" => post_params}) do
    case Admins.create_post(post_params) do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Post created successfully.")
        |> redirect(to: Routes.post_path(conn, :show, post))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    post = Admins.get_post!(id)
    render(conn, "show.html", post: post)
  end

  def edit(conn, %{"id" => id}) do
    post = Admins.get_post!(id)
    changeset = Admins.change_post(post)
    render(conn, "edit.html", post: post, changeset: changeset)
  end

  def update(conn, %{"id" => id, "post" => post_params}) do
    post = Admins.get_post!(id)

    case Admins.update_post(post, post_params) do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Post update successful.")
        |> redirect(to: Routes.post_path(conn, :show, post))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", post: post, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    post = Admins.get_post!(id)
    {:ok, _post} = Admins.delete_post(post)

    conn
    |> put_flash(:info, "Post delete successful.")
    |> redirect(to: Routes.post_path(conn, :index))
  end
end
