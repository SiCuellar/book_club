require 'rails_helper'

describe 'user can create a book' do
  it 'when visiting /books/new' do
    visit new_book_path
    book_name = "Dracula"
    fill_in 'book[title]', with: book_name
    book_author = "Stoker"
    fill_in 'book[authors]', with: book_author
    book_publish = 1810
    fill_in 'book[year_published]', with: book_publish
    book_page_count = 336
    fill_in 'book[page_count]', with: book_page_count

    click_on "Create Book!"
    # save_and_open_page

    expect(current_path).to eq("/books/#{Book.last.id}")
    expect(page).to have_content(book_name)
    expect(page).to have_content(book_author)
    expect(page).to have_content("Page Count: #{book_page_count}")
  end
end
