class AddQueriesIndex < ActiveRecord::Migration
  def change
    add_index :queries, :querier_id
  end
end
