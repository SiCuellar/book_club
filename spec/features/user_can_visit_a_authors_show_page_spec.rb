require 'rails_helper'

describe 'Author show page' do
  it 'user can see author info' do

    author_1 = Author.create(name: "Alexander Dumas")
    user_1 = User.create(username: "Silver")
    user_2 = User.create(username: "Thomas")
    book_1 = author_1.books.create(title: "The Count of Monte Cristo", pages: 346, year_published: 1844)
    book_2 = author_1.books.create(title: "The Three Musketeers", pages: 700 , year_published: 1844)
    book_3 = author_1.books.create(title: "The Black Tulip", pages: 234 , year_published: 1850)

    book_1.reviews.create(
                title: "Basic.",
                body: "I enjoyed this book.",
                rating: 3.0,
                user_id: user_1.id)
    book_1.reviews.create(
                title: "This Sucked",
                body: "There are ways.",
                rating: 1.5,
                user_id: user_2.id)
    book_2.reviews.create(
                title: "Awesome",
                body: "Best Book Ever!",
                rating: 4.5,
                user_id: user_1.id)
    book_2.reviews.create(
                title: "This was okay",
                body: "mehhhhhh",
                rating: 2.0,
                user_id: user_2.id)
    book_3.reviews.create(
                title: "Decent",
                body: "Hey, that's pretty good!",
                rating: 2.5,
                user_id: user_1.id)
    book_3.reviews.create(
                title: "So so",
                body: "mediocre",
                rating: 2,
                user_id: user_2.id)


    expect(page).to have_content("Alexander Dumas")
    expect(page).to have_content("The Count of Monte Cristo")
    expect(page).to have_content("The Three Musketeers")
    expect(page).to have_content("The Black Tulip")
    expect(page).to have_content("346")
    expect(page).to have_content("Basic.")
    expect(page).to have_content("Decent")
    expect(page).to have_content("So so")
  end
end
