class AddColumnUsers < ActiveRecord::Migration
  def change
    add_column :users, :logo_image_url, :string
  end
end
