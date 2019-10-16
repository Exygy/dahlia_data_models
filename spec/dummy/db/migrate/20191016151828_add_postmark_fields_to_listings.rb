class AddPostmarkFieldsToListings < ActiveRecord::Migration[5.1]
  def change
    add_column :listings, :accepts_postmark, :boolean, default: false
    add_column :listings, :postmark_due_date, :date
  end
end
