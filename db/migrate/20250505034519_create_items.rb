class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.integer :item_category_id, null: false
      t.integer :item_condition_id, null: false
      t.integer :delivery_fee_id, null: false
      t.integer :price, null: false
      t.timestamps
    end
  end
end
