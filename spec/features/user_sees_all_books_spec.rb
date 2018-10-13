require 'pry'
require 'rails_helper'

describe 'book index' do

  before (:each) do
    @user_1 = User.create(name: "Silver")
    @user_2 = User.create(name: "Tom")

    @book_1 = Book.create!(title: "The Count of Monte Cristo", page_count: 346, year_published: 1844)
    @book_2  = Book.create!(title: "The Road", page_count: 349, year_published: 1999)
    @book_3 = Book.create!(title: "Crime and Punishment", page_count: 458, year_published: 1866)

    @author_1 = @book_1.authors.create(name: "Alexander Dumas")
    @author_2 = @book_2.authors.create(name: "Something McCormick")
    @author_3 = @book_3.authors.create(name: "Fyodor Dostoyevsky")

    @review_1 = @user_1.reviews.create(title: "This Sucked", review: "There are ways.", rating: 1.5, book_id: @book_1.id)
    @review_2 = @user_1.reviews.create(title: "Basic", review: "This was okay.", rating: 3.0, book_id: @book_1.id)
    @review_3 = @user_2.reviews.create(title: "Awesome", review: "Best book ever.", rating: 4.5, book_id: @book_2.id)
    @review_4 = @user_2.reviews.create(title: "Meh!", review: "I do not even know.", rating: 3.0, book_id: @book_2.id)
  end

  it 'user can see total book ratings and average' do
    visit '/books'

    expect(page).to have_content("Rating: 2.3")
    expect(page).to have_content("Total Reviews: 2")
  end

  # xit 'user can click links to sort books(6 different sorting ways)' do
  #   visit '/books'
  #   # save_and_open_page
  #   y = page.find("#sort_buttons")
  #   x = y.all("a").first
  #   click_on(x)
  #   expect(current_path).to eq('/books?sort=rating_asc')
  #
  #   click_on('Average Rating (ascending)')
  #   expect(current_path).to eq('/books?sort=rating&direction=asc')
  #
  #   click_on('Average Rating (ascending)')
  #   expect(current_path).to eq('/books?sort=rating&direction=asc')
  #
  #   click_on('Average Rating (ascending)')
  #   expect(current_path).to eq('/books?sort=rating&direction=asc')
  #
  #   click_on('Average Rating (ascending)')
  #   expect(current_path).to eq('/books?sort=rating&direction=asc')
  #
  #   click_on('Average Rating (ascending)')
  #   expect(current_path).to eq('/books?sort=rating&direction=asc')
  # end

 #  describe 'Sorting Methods' do
 #    within(book-card)
 #
 #    fill_in('book',with: "adfasdfad")
 #  end
 # make sure to check how to actually test this?


end
