class CreateWorkExperiences < ActiveRecord::Migration[5.0]
  def change
    create_table :work_experiences do |t|
      t.integer :order
      t.references :profile, foreign_key: true
      t.string :name
      t.string :years

      t.timestamps
    end
  end
end
