class Machine < ApplicationRecord
  belongs_to :owner
  has_many :stocks
  has_many :snacks, through: :stocks
end
