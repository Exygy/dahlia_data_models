class AddApplicationDownloadToListings < ActiveRecord::Migration[5.1]
  def change
    add_column :listings, :application_download_url, :string
  end
end