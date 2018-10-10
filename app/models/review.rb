class Review < ApplicationRecord
  validates_presence_of :title
  belongs_to :book
  belongs_to :user
end
