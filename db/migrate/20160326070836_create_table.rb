class CreateTable < ActiveRecord::Migration[5.0]
  def change
    create_table :ranks do |t|
      t.references :profile, foreign_key: true
      t.references :exam_type, foreign_key: true
      t.integer :rank
    end
  end
end
