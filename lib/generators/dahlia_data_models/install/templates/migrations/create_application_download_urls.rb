class CreateApplicationDownloadUrls < ActiveRecord::Migration<%= migration_version %>
  def change
    create_table "application_download_urls" do |t|
      t.integer "listing_id"
      t.string "label"
      t.string "url"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end