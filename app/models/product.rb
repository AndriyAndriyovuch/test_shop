class Product < ApplicationRecord
  before_create :round_price

  validates :name, :description, presence: true
  validates :price, :balance, numericality: { greater_than: 0 }

  private

  def round_price
    self.price = price.round(2)
  end
end