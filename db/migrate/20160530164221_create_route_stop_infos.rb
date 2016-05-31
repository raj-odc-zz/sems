class CreateRouteStopInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :route_stop_infos do |t|
      t.string :name
      t.float :amount
      t.references :transport_route_info, foreign_key: true
      t.timestamps
    end
  end
end
