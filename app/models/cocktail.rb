class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  validates_associated :ingredients
  validates :name, uniqueness: true
  validates_presence_of :name
end
