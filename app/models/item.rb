class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :image,             presence: true
  validates :title,             presence: true
  validates :explan,            presence: true
  validates :category_id,       presence: true, numericality: { other_than: 1 }
  validates :condition_id,      presence: true, numericality: { other_than: 1 }
  validates :shipping_cost_id,  presence: true, numericality: { other_than: 1 }
  validates :region_id,         presence: true, numericality: { other_than: 1 }
  validates :delivery_date_id,  presence: true, numericality: { other_than: 1 }
  validates :cost,              presence: true, numericality: { greater_than: 0 }

end
