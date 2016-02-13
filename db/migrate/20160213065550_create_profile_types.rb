class CreateProfileTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :profile_types do |t|

      t.timestamps
    end
  end
end
