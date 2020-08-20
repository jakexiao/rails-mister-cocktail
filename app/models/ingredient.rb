class Ingredient < ApplicationRecord
  has_many :doses
  # belongs_to :cocktail, through: :doses
  validates :name, presence: true, uniqueness: true
end
