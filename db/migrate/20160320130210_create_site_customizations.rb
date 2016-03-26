class CreateSiteCustomizations < ActiveRecord::Migration[5.0]
  def change
    create_table :site_customizations do |t|
      t.string :menu_name
      t.string :bg_color
      t.string :text_color
      t.string :font_style
      t.references :boards, foreign_key: true
      t.timestamps
    end
  end
end
