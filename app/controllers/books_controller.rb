class BooksController < ApplicationController
  before_action :require_logged_in
  skip_before_action :require_logged_in, only: [:index, :show]

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @user = current_user
    @book = @user.books.build(book_params)
    binding.pry
    if @book.save
    redirect_to book_path(@book)
    else
    render :new
    end
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book)
  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
    def book_params
      params.require(:book).permit(
        :title, :author, :description, :finished, :user_id, :category_id, :category_name)
    end

end
