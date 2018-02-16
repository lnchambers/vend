class Snack < ApplicationRecord
  validates_presence_of :name, :price
  has_many :stocks
  has_many :machines, through: :stocks

  def price_format
    (price.to_f / 100).round(2)
  end
end
