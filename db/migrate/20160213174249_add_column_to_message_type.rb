class AddColumnToMessageType < ActiveRecord::Migration[5.0]
  def change
    add_column :message_types, :name, :string
  end
end
