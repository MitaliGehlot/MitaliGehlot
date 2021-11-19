class Product < ApplicationRecord
  mount_uploader :file, ProductFileUploader
  belongs_to :category
  has_many :orders
  has_one :wishlist
 

  def self.search(search, category_id)
    category = Category.find_by(id: category_id)
  if search
      category.products.where('name LIKE ?', "%#{search}%")
    else
      category.products
    end
  end
end