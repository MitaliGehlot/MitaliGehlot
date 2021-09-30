class Customer < ApplicationRecord
	@customer=Customer.new
	@payments = Customer.new
   validates :f_name, presence: true
  validates :password, presence: true, length: { minimum: 10 }
end
