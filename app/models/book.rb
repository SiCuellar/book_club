# Book Class
class Book < ApplicationRecord
  validates_presence_of :title,
                        :page_count,
                        :year_published

  has_many :book_authors
  has_many :authors, through: :book_authors
  has_many :reviews

  def average_rating
    reviews.average(:rating).to_f.round(1)
  end

  def review_count
    reviews.count
  end

  def self.sort_avg_rating_desc
    select('books.*, AVG(rating) AS avg_rating')
    .joins(:reviews)
    .group(:id)
    .order('avg_rating DESC')
  end

  def self.sort_avg_rating_asc
    select('books.*, AVG(rating) AS avg_rating')
    .joins(:reviews)
    .group(:id)
    .order('avg_rating ASC')
  end

  def self.sort_pages_asc
    order(:page_count)
  end
end
