class OrderForm
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :street, :building, :phone, :user_id, :item_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :street
    validates :phone, format: { with: /\A\d{11}\z/, message: 'is invalid' }
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(order_id: order.id, postcode: postcode, prefecture_id: prefecture_id, city: city, street: street, building: building, phone: phone)
  end
end