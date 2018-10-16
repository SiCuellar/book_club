class BooksController < ApplicationController
  def index
    @books = Book.check_params(params)
  end

  def new
    @book = Book.new
  end

  def create
    # binding.pry
    if Author.find_by_name(params[:book][:authors].downcase)
      author = Author.find_by_name(params[:authors])
    else
      author = Author.new(name: params[:book][:authors])
    end

    book = Book.new(book_params)
    if book.save
      redirect_to "/books/#{book.id}"
    else
      render :new
    end

    book.authors << author
  end

  def show
    @book = Book.find(params[:id])
    @reviews = @book.reviews
  end



  private

  def book_params
    params.require(:book).permit(:title, :page_count, :year_published)
  end
end
