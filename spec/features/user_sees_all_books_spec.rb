require 'pry'
require 'rails_helper'

describe 'book index' do
  it 'user can see all book titles' do

    book_author_1 = BookAuthor.create({book_id: 1, author_id: 1 })

    author_1 = Author.create(name: "basic Ttttttom")

    book_1 = Book.create!(title: "The Count of Monte Cristo", page_count: 346, year: 1844)
    book_2 = Book.create!(title: "The Art of War", page_count: 246, year: 1)
    book_3 = Book.create!(title: "Crime and Punishment", page_count: 458, year: 1866)

    visit 'books'

    save_and_open_page
    expect(page).to have_content("Title: #{book_1.title}")
    expect(page).to have_content("Publication year: #{book_1.year}")
    expect(page).to have_content("Title: #{book_2.title}")
    expect(page).to have_content("Page Count: #{book_2.page_count}")
    expect(page).to have_content("Page Count: #{book_3.page_count}")
    expect(page).to have_content("Publication year: #{book_3.year}")
    expect(page).to have_content("Publication year: #{book_3.year}")
    # expect(page).to have_content("Author(s): #{book_author_1.author_id}")
  end
end
