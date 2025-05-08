class AddSeiToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :sei, :string
  end
end
