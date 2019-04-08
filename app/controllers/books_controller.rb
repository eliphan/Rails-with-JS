class BooksController < ApplicationController
  before_action :require_logged_in, except: [:show, :index]
  before_action :set_user

  def index
    if params[:user_id]
      @books = User.find(params[:user_id]).books 
      respond_to do |format|
        format.html { render :index }
        format.json { render json: @books }
      end
    else
      @books = Book.all
      respond_to do |format|
        format.html { render :index}
        format.json { render json: @books }
      end
    end
  end

  def show
    @book = Book.find(params[:id])
    @chapters = @book.chapters
    @review= @book.reviews.build
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @book }
    end
  end

  def new
    @book = Book.new
  end

  def create
    @book = @user.books.build(book_params)
    
    if @book.save
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  def edit  
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    if @book.user = @user
      if @book.save
        @book.update(book_params)
        redirect_to book_path(@book)
      else
        flash[:message] = "There was an error updating this book."
        redirect_to book_path(@book)
      end
    else
        flash[:message] = "You can't edit this book."
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.user = @user
      @book.destroy
      redirect_to books_path
    else
      flash[:message] = "You can't delete this book."
    end
  end

  private
    def book_params
      params.require(:book).permit(
        :title, 
        :author, 
        :description, 
        :finished, 
        :user_id,
        :category_id, 
        category_attributes:[:name],
        review_contents:[]
        )
    end

end
