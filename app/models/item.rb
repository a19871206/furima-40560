class Item < ApplicationRecord
  belongs_to :user
  
  validates :title,             presence: true
  validates :explan,            presence: true
  validates :category_id,       presence: true
  validates :condition_id,      presence: true
  validates :shipping_cost_id,  presence: true
  validates :region_id,         presence: true
  validates :delivery_date_id,  presence: true
  validates :cost,              presence: true, numericality: { greater_than: 0 }
end
