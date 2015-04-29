class AddQueriesColumnSeesionToken < ActiveRecord::Migration
  def change
    add_column :queries, :session_token, :string

    add_index :queries, :session_token
  end
end
