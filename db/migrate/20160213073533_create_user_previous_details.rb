class CreateUserPreviousDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :user_previous_details do |t|

      t.timestamps
    end
  end
end
