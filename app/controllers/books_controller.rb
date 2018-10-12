class BooksController < ApplicationController
  def index
    if params[:sort] == "ratingasc"
      @books = Book.sort_avg_rating_asc
    else
      @books = Book.all
    end
  end



end
