require 'rails_helper'

describe Review, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:title)}
    it { should validate_presence_of(:review)}
    it { should validate_presence_of(:rating)}
    # it { should validate_numericality_of(:rating)
    #     is_less_than_or_equal_to(5.0)}
  end

  describe 'Relationship' do
    it { should belong_to(:book) }
  end

  describe 'Methods' do

    it 'can find reviews that belong to a user' do
      author_1 = Author.create(name: 'Alexander Dumas')
      book_1 = Book.create(title: 'The Count of Monte Cristo', pages: 346, year_published: 1844)
      user_1 = User.create(username: "Silver")
      review_1 = Review.create(
                title: "Basic.",
                body: "I enjoyed this book.",
                rating: 3.0,
      review_2 = Review.create(
                title: "This Sucked",
                body: "There are ways.",
                rating: 1.5,

      review_1.user_id = user_1.id
      review_1.book_id = book_1.id
      review_2.user_id = user_1.id
      review_2.book_id = book_1.id

      reviews = Review.find_reviews_by_user_id(user_1.id)
      expect(reviews.first.title).to eq("Basic")
      expect(reviews.second.title).to eq("This Sucked")
    end
  end
end
