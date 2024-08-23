class OrderForm  include ActiveModel::Model

  attr_accessor :zip_code, :region_id, :city, :address, :another, :phone_number, :user_id, :item_id

  validates :zip_code,     presence: true
  validates :region_id,    presence: true
  validates :city,         presence: true
  validates :address,      presence: true
  validates :phone_number, presence: true
end