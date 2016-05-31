class CreateTransportRouteInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :transport_route_infos do |t|
      t.string :name
      t.float :amount
      t.references :profile, foreign_key: true
      t.string :bus_info
      t.timestamps
    end
  end
end
