require 'rails_helper'

describe Book, type: :model do

  describe 'Validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:page_count) }
    it { should validate_presence_of(:year_published) }
  end

  describe 'Relationship' do
    it { should have_many(:book_authors) }
    it { should have_many(:authors) }
    it { should have_many(:reviews) }
  end

  describe 'Sorting Methods' do
    before(:each) do
      @user_1 = User.create(name: "Silver")
      @user_2 = User.create(name: "Tom")

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
      @review_6 = @user_2.reviews.create(title: "t6", review: "review 6", rating: 3.0, book_id: @book_3.id)
    end

    it '.sort_avg_rating_asc' do
      params = {sort: "rating_asc"}
      first, *,last = Book.check_params(params)
      expect(first.title).to eq(@book_1.title)
      expect(last.title).to eq(@book_3.title)
    end

    it '.sort_avg_rating_desc' do
      params = {sort: "rating_desc"}
      first, *,last = Book.check_params(params)
      expect(first.title).to eq(@book_3.title)
      expect(last.title).to eq(@book_1.title)
    end

    it '.sort_review_count_desc' do
      params = {sort: "review_count_desc"}
      first, *,last = Book.check_params(params)
      expect(first.title).to eq(@book_1.title)
      expect(last.title).to eq(@book_3.title)
    end

    it '.sort_review_count_asc' do
      params = {sort: "review_count_asc"}
      first, *,last = Book.check_params(params)
      expect(first.title).to eq(@book_3.title)
      expect(last.title).to eq(@book_1.title)
    end

    it '.sort_page_asc' do
      params = {sort: "page_asc"}
      first, *,last = Book.check_params(params)
      expect(first.title).to eq(@book_1.title)
      expect(last.title).to eq(@book_3.title)
    end

    it '.sort_page_desc' do
      params = {sort: "page_desc"}
      first, *,last = Book.check_params(params)
      expect(first.title).to eq(@book_3.title)
      expect(last.title).to eq(@book_1.title)
    end

    it '.top_three_rated_books' do
      params = {}
      books = Book.check_params(params)
      book_set = books.top_books

      expect(book_set.length).to eq(3)
      expect(book_set.first.title).to eq(@book_3.title)
    end

    it '.garbage_books' do
      params = {}
      books = Book.check_params(params)
      book_set = books.garbage_books

      expect(book_set.length).to eq(3)
      expect(book_set.first.title).to eq(@book_1.title)
    end

    xit '.top_users' do
      params = {}
      books = Book.check_params(params)
      book_set = books.garbage_books

      expect(book_set.length).to eq(3)
      expect(book_set.first.title).to eq(@book_1.title)
    end

  end
end
