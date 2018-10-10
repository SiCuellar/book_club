class Book < ApplicationRecord
  validates_presence_of :title 
  belongs_to :author
  has_many :book_authors
  has_many :authors, through: :book_authors
end
