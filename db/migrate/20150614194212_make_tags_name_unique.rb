class MakeTagsNameUnique < ActiveRecord::Migration
  def change
    change_column :tags, :name, :string, unique: true
  end
end
