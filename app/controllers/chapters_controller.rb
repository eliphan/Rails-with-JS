class ChaptersController < ApplicationController
  before_action :require_logged_in, except: [:show, :index]
  before_action :set_user

  def index
      @book = Book.find_by(id: params[:book_id])
      @chapters = @book.chapters
  end

  def show
    @chapter = Chapter.find(params[:id])
  end

  def new
    @book = Book.find_by(id: params[:book_id])
    if params[:book_id] && !Book.exists?(params[:book_id])
      redirect_to books_path
    else
       @chapter = Chapter.new(book_id: params[:book_id])
    end
  end

  def create
    @chapter = Chapter.new(chapter_params)
    @book = Book.find_by(id: params[:book_id])
      if @chapter.save
          redirect_to chapter_path(@chapter)
      else
          render :new
      end
  end

  def update
    @chapter = Chapter.find(params[:id])
    if @chapter.user = current_user
      @chapter.update(chapter_params)
      redirect_to chapter_path(@chapter)
    else
      flash[:message] = "You can't edit this chapter."
    end
  end

  def edit
    @chapter = Chapter.find(params[:id])
  end

  def destroy
    @chapter = Chapter.find(params[:id])
    if @chapter.user = current_user
      @chapter.destroy
      redirect_to book_path(@chapter.book)
    else
      flash[:message] = "You can't edit this chapter."
    end
  end

  private
    def chapter_params
      params.require(:chapter).permit(
        :chapter_title, :chapter_content, :book_id)
    end

end
