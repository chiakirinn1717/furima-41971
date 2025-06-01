class AddressHistory
    include ActiveModel::Model
    attr_accessor :zipcode, :prefecture_id, :city, :street, :building, :phone_number, :user_id, :item_id, :token

    with_options presence: true do
        validates :zipcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
        validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
        validates :city
        validates :street
        validates :phone_number, numericality: {only_integer: true}, format: { with: /\A\d{10}\z/, message:"is too short" }
        validates :token
        validates :user_id
        validates :item_id
    end

    def save
        history = History.create(user_id: user_id, item_id: item_id)
        address = Address.create(zipcode: zipcode, prefecture_id: prefecture_id, city: city, street: street, building: building, phone_number: phone_number, history_id: history.id)
    end
end