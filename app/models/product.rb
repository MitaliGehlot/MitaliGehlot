class Product < ApplicationRecord
  mount_uploader :file, ProductFileUploader
  belongs_to :category
  has_many :orders
end
