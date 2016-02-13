class AddColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :role, foreign_key: true
    add_reference :users, :profile, foreign_key: true

  end
end