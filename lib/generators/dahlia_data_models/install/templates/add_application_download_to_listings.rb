class AddApplicationDownloadToListings < ActiveRecord::Migration<%= migration_version %>
  def change
    add_column :listings, :application_download_url, :string
  end
end