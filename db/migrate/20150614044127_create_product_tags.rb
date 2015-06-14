class CreateProductTags < ActiveRecord::Migration
  def change
    create_table :product_tags do |t|
      t.integer :product_id, null: false
      t.integer :tag_id, null: false

      t.timestamps
    end
    add_index :product_tags, [:product_id, :tag_id], unique: true
    add_index :product_tags, [:tag_id, :product_id], unique: true
  end
end
