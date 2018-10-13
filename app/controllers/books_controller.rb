class BooksController < ApplicationController
  def index
    @books = Book.check_params(params)
  end
end
