class ChangeNicknameNotNullInUsers < ActiveRecord::Migration[7.1]
  def change
    change_column_null :users, :nickname, false
    change_column_null :users, :sei, false
    change_column_null :users, :mei, false
    change_column_null :users, :sei_kana, false
    change_column_null :users, :mei_kana, false
    change_column_null :users, :birthday, false
  end
end
