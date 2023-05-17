class Product < ApplicationRecord
  before_create :round_price
  before_update :round_price

  has_many :product_orders, dependent: :destroy
  has_many :orders, through: :product_orders

  validates :name, :description, presence: true
  validates :price, :balance, numericality: { greater_than: 0 }

  private

  def round_price
    self.price = price.round(2)
  end
end
