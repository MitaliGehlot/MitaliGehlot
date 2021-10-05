class Category < ApplicationRecord
	validates :category_name, presence: true
    @category = Category.new
	has_many :products,dependent: :destroy
end
