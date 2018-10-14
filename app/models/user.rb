class User < ApplicationRecord
  validates_presence_of :name
  has_many :reviews

  def check_params(params)
    if params[:sort] == 'oldest'
      sort_by_oldest
    elsif params[:sort] == 'newest'
      sort_by_newest
    else
      reviews.all
    end

  end
  #
  def user_review_sort
    select('users.*, count(reviews) as review_count')
    .joins(:reviews)
    .group(:user_id, :id)
  end

  def self.most_active_users
    user_review_sort
    order("review_count DESC")
    .limit(3)
  end
end
