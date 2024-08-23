class OrderForm 
   include ActiveModel::Model

  attr_accessor :zip_code, :region_id, :city, :address, :another, :phone_number, :user_id, :item_id, :token

  validates :zip_code,     presence: true
  validates :region_id,    presence: true
  validates :city,         presence: true
  validates :address,      presence: true
  validates :phone_number, presence: true
  validates :token,        presence: true

  def save
  order = Order.create(user_id: user_id, item_id: item_id)
  Seller.create(order_id: order.id, zip_code: zip_code, region_id: region_id,
                city: city, address: address,
                another: another, phone_number: phone_number)
  end

end