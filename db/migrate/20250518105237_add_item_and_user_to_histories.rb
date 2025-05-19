class AddItemAndUserToHistories < ActiveRecord::Migration[7.1]
  def change
    add_reference :histories, :item, null: false, foreign_key: true
    add_reference :histories, :user, null: false, foreign_key: true
  end
end
