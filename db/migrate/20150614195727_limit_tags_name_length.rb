class LimitTagsNameLength < ActiveRecord::Migration
  def change
    change_column :tags, :name, :string, limit: 20
  end
end
