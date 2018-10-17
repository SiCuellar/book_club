require 'rails_helper'

describe 'user can create a book' do

  before(:each) do
    @user_1 = User.create(name: "Silver")
    @book_1 = Book.create!(title: "The Count of Monte Cristo", page_count: 346, year_published: 1844)
    @author_1 = @book_1.authors.create(name: "Alexander Dumas")
    @review_1 = @user_1.reviews.create(title: "This Sucked", review: "There are ways.", rating: 1.5, book_id: @book_1.id)
    @review_2 = @user_1.reviews.create(title: "Basic", review: "This was okay.", rating: 3.0, book_id: @book_1.id)
    @review_3 = @user_1.reviews.create(title: "Awesome", review: "Best book ever.", rating: 4.5, book_id: @book_1.id)
    @review_4 = @user_1.reviews.create(title: "asdfdf", review: "Basdfasdf.", rating: 1, book_id: @book_1.id)
  end

  describe'when visiting /books/id' do
    it "see book atrributes" do
      visit ("/books/#{@book_1.id}")
      expect(page).to have_content(@book_1.title)
      expect(page).to have_content(@book_1.authors.name)
    end

    it 'see top three reviews' do
      visit ("/books/#{@book_1.id}")
      within('#Stats') do
        expect(page).to have_content(@review_3.title)
        expect(page).to have_content(@review_3.rating)
      end
    end
  end
end
