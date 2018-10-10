class Book < ApplicationRecord
  validates_presence_of :title
  has_many :book_authors
  has_many :authors, through: :book_authors
end
