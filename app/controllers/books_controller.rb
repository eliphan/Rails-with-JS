class BooksController < ApplicationController
  before_action :require_logged_in, except: [:show, :index]
  before_action :set_user

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
    if @book.save
    redirect_to book_path(@book)
    else
    render :new
    end
  end

  def edit
    author = Book.author.find_by_id(params[:user_id])
    @book = author.books.find_by_id(params[:_id])
  
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book)
  end



  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
    def book_params
      params.require(:book).permit(
        :title, :author, :description, :finished, :user_id, :category_id, category_attributes:[:name])
    end

end
