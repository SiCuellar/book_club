require 'pry'
require 'rails_helper'

describe 'book index' do
  it 'user can see all book titles' do




    book_1 = Book.create!(title: "The Count of Monte Cristo", page_count: 346, year: 1844)
    author_1 = book_1.authors.create(name: "Alexander Dumas")


    book_2 = Book.create!(title: "The Art of War", page_count: 246, year: 1)
    author_2 = book_2.authors.create(name: "Sun Tzue")

    book_3 = Book.create!(title: "Crime and Punishment", page_count: 458, year: 1866)
    author_3 = book_3.authors.create(name: "Fyodor Dostoyevsky")


    visit 'books'

    expect(page).to have_content("Title: #{book_1.title}")
    expect(page).to have_content("Publication year: #{book_1.year}")
    expect(page).to have_content("Title: #{book_2.title}")
    expect(page).to have_content("Page Count: #{book_2.page_count}")
    expect(page).to have_content("Page Count: #{book_3.page_count}")
    expect(page).to have_content("Publication year: #{book_3.year}")
    expect(page).to have_content("Publication year: #{book_3.year}")
    expect(page).to have_content("Author(s): #{author_1.name}")
  end
end
