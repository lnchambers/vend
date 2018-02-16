class Snack < ApplicationRecord
  validates_presence_of :name, :price
  has_many :stocks
  has_many :machines, through: :stocks
end
