require 'rails_helper'


describe User, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:name) }
  end


  describe 'Relationship' do
    it { should have_many(:reviews) }
  end

  describe 'Sorting Methods' do
    before(:each) do
      @user_1 = User.create(name: "Silver")
      @user_2 = User.create(name: "Tom")
      @user_3 = User.create(name: "Kate")

      @book_1 = Book.create!(title: "book1", page_count: 346, year_published: 1844)
      @book_2  = Book.create!(title: "book2", page_count: 349, year_published: 1999)
      @book_3 = Book.create!(title: "book3", page_count: 458, year_published: 1866)


      @author_1 = @book_1.authors.create(name: "Alexander Dumas")
      @author_2 = @book_2.authors.create(name: "Something McCormick")
      @author_3 = @book_3.authors.create(name: "Fyodor Dostoyevsky")

      @review_1 = @user_1.reviews.create(title: "t1", review: "review 1", rating: 1.0, book_id: @book_1.id)
      @review_2 = @user_1.reviews.create(title: "t2", review: "review 2", rating: 1.2, book_id: @book_1.id)
      @review_3 = @user_1.reviews.create(title: "t3", review: "review 3", rating: 1.3, book_id: @book_1.id)
      @review_4 = @user_2.reviews.create(title: "t4", review: "review 4", rating: 2.0, book_id: @book_2.id)
      @review_5 = @user_2.reviews.create(title: "t5", review: "review 5", rating: 2.1, book_id: @book_2.id)
      @review_6 = @user_3.reviews.create(title: "t6", review: "review 6", rating: 3.0, book_id: @book_3.id)
    end

    it '.most_active_users' do
      
    end


  end

end
