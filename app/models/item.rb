class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_cost
  belongs_to :region
  belongs_to :delivery_date

  validates :image,             presence: true
  validates :title,             presence: true
  validates :explan,            presence: true
  validates :category_id,       presence: true, numericality: { other_than: 1 }
  validates :condition_id,      presence: true, numericality: { other_than: 1 }
  validates :shipping_cost_id,  presence: true, numericality: { other_than: 1 }
  validates :region_id,         presence: true, numericality: { other_than: 1 }
  validates :delivery_date_id,  presence: true, numericality: { other_than: 1 }
  validates :cost,              presence: true, numericality: { greater_than: 0, less_than_or_equal_to: 9999999 }
  validate :cost_within_range

  private
  
  def cost_within_range
    if cost.present? && (cost < 300 || cost > 9999999)
      errors.add(:cost, '価格は¥300から¥9,999,999の間で入力してください')
    end
  end
end
