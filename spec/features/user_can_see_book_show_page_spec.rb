require 'rails_helper'

describe 'user can create a book' do

  before(:each) do
    @book_1 = Book.create!(title: "The Count of Monte Cristo", page_count: 346, year_published: 1844)
    @author_1 = @book_1.authors.create(name: "Alexander Dumas")
    @review_1 = @user_1.reviews.create(title: "This Sucked", review: "There are ways.", rating: 1.5, book_id: @book_1.id)
    @review_2 = @user_1.reviews.create(title: "Basic", review: "This was okay.", rating: 3.0, book_id: @book_1.id)
    @review_3 = @user_2.reviews.create(title: "Awesome", review: "Best book ever.", rating: 4.5, book_id: @book_2.id)
  end

  it 'when visiting /books/id' do
    visit book_path
    expect(current_path).to eq("/books/#{Book.last.id}")
    expect(page).to have_content(book_name)
    expect(page).to have_content(book_author)
    expect(page).to have_content("Page Count: #{book_page_count}")
  end
end
