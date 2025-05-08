class AddSeiKanaToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :sei_kana, :string
  end
end
