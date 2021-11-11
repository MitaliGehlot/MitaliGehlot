class Category < ApplicationRecord

	validates :category_name, presence: true
	has_many :products, dependent: :destroy

  def self.search(search)
    if search
      Category.where('category_name LIKE ?', "%#{search}%")
    else
      Category.all
    end
  end
end
