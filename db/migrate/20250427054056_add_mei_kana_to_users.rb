class AddMeiKanaToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :mei_kana, :string
  end
end
