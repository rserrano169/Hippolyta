class CreateQueries < ActiveRecord::Migration
  def change
    create_table :queries do |t|
      t.integer :querier_id
      t.string :keywords

      t.timestamps
    end
  end
end
