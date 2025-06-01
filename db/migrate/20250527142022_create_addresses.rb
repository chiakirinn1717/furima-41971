class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses do |t|
      t.string  :zipcode,  null: false
      t.integer :prefecture_id, null: false
      t.string  :city, null: false
      t.string  :street, null: false
      t.string  :building
      t.string  :phone_number, null: false
      t.references :history, null: false, foreign_key: true
      t.timestamps
    end
  end
end
