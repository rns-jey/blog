class Article < ApplicationRecord
  has_many :comments
  
  validates :title, :author, :content, presence: true
end
