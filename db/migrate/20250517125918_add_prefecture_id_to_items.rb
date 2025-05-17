class AddPrefectureIdToItems < ActiveRecord::Migration[7.1]
  def change
    add_column :items, :prefecture_id, :integer
  end
end
