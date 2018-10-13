class BooksController < ApplicationController
  def index
    if params[:sort] == "ratingasc"
      @books = Book.sort_avg_rating_asc
    elsif params[:sort] == "ratingdesc"
      @books = Book.sort_avg_rating_desc
    elsif params[:sort] == "pageasc"
      @books = Book.sort_pages_asc
    elsif params[:sort] == "pagedesc"
      @books = Book.sort_pages_desc
    else
      @books = Book.all
    end
  end

end
