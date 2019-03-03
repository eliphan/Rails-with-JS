class ChaptersController < ApplicationController
  before_action :require_logged_in, except: [:show, :index]
  before_action :set_user

  def index
    if params[:book_id] && !Book.exists?(params[:book_id])
        redirect_to books_path
    else
        @book = Book.find_by_id(params[:book_id])
        @chapters = @book.chapters
    end
  end

  def show
    @chapter = Chapter.find(params[:id])
  end

  def new
    if params[:book_id] && !Book.exists?(params[:book_id])
        redirect_to books_path
    else
       @chapter = Chapter.new(book_id: params[:book_id])
    end
  end

  def create
     @chapter = Chapter.new(chapter_params)
        if @chapter.save
            redirect_to @chapter
        else
            render :new
        end
     
  end

  def update
    @chapter = Chapter.find(params[:id])
    @chapter.update(chapter_params)
    redirect_to chapter_path(@chapter)
  end

  def edit
    @chapter = Chapter.find(params[:id])
  end

  def destroy
    @chapter = Chapter.find(params[:id])
    @chapter.destroy
    redirect_to book_chapters_path
  end

  private
    def chapter_params
      params.require(:chapter).permit(
        :chapter_title, :chapter_content, :user_id, :book_id)
    end

end
