class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :title,             presence: true
  validates :explan,            presence: true
  validates :category_id,       presence: true
  validates :condition_id,      presence: true
  validates :shipping_cost_id,  presence: true
  validates :region_id,         presence: true
  validates :delivery_date_id,  presence: true
  validates :cost,              presence: true, numericality: { greater_than: 0 }

  # ジャンルの選択が「---」の時は保存できないようにする
  #validates :genre_id, numericality: { other_than: 1 }
  # ジャンルの選択が「---」の時は保存できないようにする
  #validates :genre_id, numericality: { other_than: 1, message: "can't be blank" }
end
