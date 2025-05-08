class AddMeiToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :mei, :string
  end
end
