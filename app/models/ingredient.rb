class Ingredient < ApplicationRecord
  has_many :doses
  validates :name, uniqueness: true
  validates_presence_of :name
end
