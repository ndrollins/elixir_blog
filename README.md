# BlogPhx2

This blog requires a few dependencies. Some of which have already been preconfigured.
The set stack is using Elixir and Phoenix with a Postgresql database. The database handles
all of the posts.

  * Install dependencies with `mix deps.get`

  Here you should see Arc and Arc Ecto be installed, along with a few other dependencies for
  each of those.
  see [Arc](https://github.com/stavro/arc#configuration) and [Arc Ecto](https://github.com/stavro/arc_ecto)
  for additional configurations.
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser and get started with your blog.
Each of the posts is set in the post Index html page. They are currently set in a grid formation showing the
Thumbnail of your picture for the post, the title, and the date that it was originally posted. Mine is set for
only one picture to be set per post. Enjoy!

If there are any bugs or irregularities than feel free to tell me or to make additional changes on a separate 
branch.

# elixir_blog
