class Category < ApplicationRecord
	@category = Category.new
	has_many :products,dependent: :destroy
end
