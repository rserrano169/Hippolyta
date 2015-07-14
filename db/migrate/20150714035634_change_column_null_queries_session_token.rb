class ChangeColumnNullQueriesSessionToken < ActiveRecord::Migration
  def change
    change_column_null :queries, :session_token, false
  end
end
