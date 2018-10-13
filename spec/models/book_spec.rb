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

      @book_1 = Book.create!(title: "The Count of Monte Cristo", page_count: 346, year_published: 1844)
      @book_2  = Book.create!(title: "The Road", page_count: 349, year_published: 1999)
      @book_3 = Book.create!(title: "Crime and Punishment", page_count: 458, year_published: 1866)


      @author_1 = @book_1.authors.create(name: "Alexander Dumas")
      @author_2 = @book_2.authors.create(name: "Something McCormick")
      @author_3 = @book_3.authors.create(name: "Fyodor Dostoyevsky")

      @review_1 = @user_1.reviews.create(title: "This Sucked", review: "There are ways.", rating: 1.0, book_id: @book_1.id)
      @review_2 = @user_1.reviews.create(title: "Basic", review: "This was okay.", rating: 3.0, book_id: @book_1.id)
      @review_3 = @user_2.reviews.create(title: "Awesome", review: "Best book ever.", rating: 5.0, book_id: @book_2.id)
      @review_4 = @user_2.reviews.create(title: "Meh!", review: "I do not even know.", rating: 3.0, book_id: @book_2.id)
    end

    it ".sort_avg_rating_asc" do
      sorting = Book.sort_avg_rating_asc
      expect(sorting.first.title).to eq("The Count of Monte Cristo")
    end

    it ".sort_avg_rating_desc" do
      sorting = Book.sort_avg_rating_desc
      expect(sorting.first.title).to eq("The Road")
    end

    it ".sort_avg_pages_asc " do
      sorting = Book.sort_pages_asc
      expect(sorting.first.title).to eq("The Count of Monte Cristo")
    end

    # it ".sort_"

  end




end
