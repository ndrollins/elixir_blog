defmodule BlogPhx2.Avatar do
  use Arc.Definition

  # Include ecto support (requires package arc_ecto installed):
  use Arc.Ecto.Definition

  @versions [:original]

  # To add a thumbnail version:
  @versions [:original, :thumb, :blog]

   @extension_whitelist ~w(.jpg .jpeg .gif .png)

  def acl(:thumb, _), do: :public_read

  # Override the bucket on a per definition basis:
  # def bucket do
  #   :custom_bucket_name
  # end

  # Whitelist file extensions:
   def validate({file, _}) do
     ~w(.jpg .jpeg .gif .png) |> Enum.member?(Path.extname(file.file_name))
   end

  # Define a thumbnail transformation:
   def transform(:thumb, _) do
     {:convert, "-strip -thumbnail 250x250^ -gravity center -extent 250x250"}
     #{:convert, "-strip -thumbnail 250x250^ -gravity center -extent 250x250 -format png", :png}
   end

   def transform(:blog, _) do
     {:convert, "-strip -thumbnail 1440x957^ -gravity center -extent 1440x957"}
     #{:convert, "-strip -thumbnail 250x250^ -gravity center -extent 250x250 -format png", :png}
   end

  # Override the persisted filenames:
  def filename(version, {file, scope}) do
   #version
    file_name = Path.basename(file.file_name, Path.extname(file.file_name))
    "#{scope.id}_#{version}_#{file_name}"
  end

  # Override the storage directory:
  def storage_dir(version, {file, scope}) do
   "priv/static/images/blog/#{scope.id}"
  end

  def __storage, do: Arc.Storage.Local

  # Provide a default URL if there hasn't been a file uploaded
  def default_url(version, scope) do
    "/images/avatars/default_#{version}.png"
  end

  # Specify custom headers for s3 objects
  # Available options are [:cache_control, :content_disposition,
  #    :content_encoding, :content_length, :content_type,
  #    :expect, :expires, :storage_class, :website_redirect_location]
  #
  # def s3_object_headers(version, {file, scope}) do
  #   [content_type: MIME.from_path(file.file_name)]
  # end
end
