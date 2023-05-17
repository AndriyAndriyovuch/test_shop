class Order < ApplicationRecord
  has_many :product_orders, dependent: :destroy
  has_many :products, through: :product_orders

  # before_destroy :customer_validation
  #
  # private
  #
  # def customer_validation
  #   if firstname == 'null_value'
  #     errors.add(:firstname, "cannot be 'null_value'")
  #     throw(:abort)
  #   end
  # end
end
