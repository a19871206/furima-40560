class OrderForm 
   include ActiveModel::Model

  attr_accessor :zip_code, :region_id, :city, :address, :another, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
  validates :user_id
  validates :item_id

  validates :zip_code,     format: { with: /\A\d{3}-\d{4}\z/, message: "3桁ハイフン4桁" }
  validates :region_id,    numericality: { other_than: 1 }
  validates :city
  validates :address
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "10桁以上11桁以内" }
  validates :token
  end

  def save
  order = Order.create(user_id: user_id, item_id: item_id)
  Seller.create(
                order_id: order.id,
                zip_code: zip_code,
                region_id: region_id,
                city: city,
                address: address,
                another: another,
                phone_number: phone_number
                )
  end

end
