class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :item_category
  belongs_to :item_condition
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :delivery_day
  belongs_to :user
  has_one :history

  validates :image, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :item_category_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :item_condition_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_fee_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_day_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, presence: true,
                    numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, only_integer: true }
end
