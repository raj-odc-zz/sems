class AddColumnToMessage < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :title, :string
    add_column :messages, :header_content, :string
    add_reference :messages, :board, foreign_key: true
    add_reference :messages, :message_type, foreign_key: true
  end
end
