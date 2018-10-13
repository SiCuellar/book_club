# Book Class
class Book < ApplicationRecord
  validates_presence_of :title,
                        :page_count,
                        :year_published

  has_many :book_authors
  has_many :authors, through: :book_authors
  has_many :reviews

  def self.check_params(params)
    books = book_sort_base
    books = books.check_sort(params[:sort]) if params[:sort]
    return books
  end

  def self.check_sort(value)
    return sort_avg_rating_asc        if value == "rating_asc"
    return sort_avg_rating_desc       if value == "rating_desc"
    return sort_review_count_asc      if value == "review_count_asc"
    return sort_review_count_desc     if value == "review_count_desc"
    return sort_pages_asc             if value == "page_asc"
    return sort_pages_desc            if value == "page_desc"
  end

  def average_rating
    reviews.average(:rating).to_f.round(1)
  end

  def review_count
    reviews.count
  end

###########-------------sorting-----------##########
  def self.book_sort_base
    select('books.*, AVG(rating) AS avg_rating, COUNT(reviews.rating) AS rating_count')
    .joins(:reviews)
    .group(:id)
  end

  def self.sort_avg_rating_desc
    order('avg_rating DESC')
  end

  def self.sort_avg_rating_asc
    order('avg_rating ASC')
  end

  def self.sort_pages_asc
    order(:page_count)
  end

  def self.sort_pages_desc
    order('page_count DESC')
  end

  def self.sort_review_count_asc
    order('rating_count')
  end

  def self.sort_review_count_desc
    order('rating_count DESC')
  end
end
