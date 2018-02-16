class Machine < ApplicationRecord
  belongs_to :owner
  has_many :stocks
  has_many :snacks, through: :stocks

  def average_price_of_snacks
    (snacks.average(:price) / 100).round(2)
  end

  def items_count
    snacks.count
  end
end
