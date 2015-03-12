class RenameColumnUsersLogoImageUrl < ActiveRecord::Migration
  def change
    rename_column :users, :logo_image_url, :image_url
  end
end
