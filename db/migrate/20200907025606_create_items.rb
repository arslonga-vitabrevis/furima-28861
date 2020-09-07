class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,             null: false
      t.text :text,               null: false
      t.integer :item_category,   null: false
      t.integer :item_condition,  null: false
      t.integer :shipping_charge, null: false
      t.integer :shipping_origin, null: false
      t.integer :shipping_period, null: false
      t.integer :price,           null: false
      t.references :user,         null: false, foreign_key: true
      t.timestamps
    end
  end
end
