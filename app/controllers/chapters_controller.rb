class ChaptersController < ApplicationController
  before_action :set_chapter, only: [:show, :edit, :update, :destroy]
  before_action :set_book, only: [:new, :create]

  # GET /chapters/1
  def show
  end

  # GET /chapters/new
  def new
    @chapter = @book.chapters.new
  end

  # GET /chapters/1/edit
  def edit
  end

  # POST /chapters
  def create
    @chapter = @book.chapters.new(chapter_params)

    if @chapter.save
      redirect_to @book, notice: I18n.t('shared.created', resource: Chapter.model_name.human)
    else
      render :new
    end
  end

  # PATCH/PUT /chapters/1
  def update
    if @chapter.update(chapter_params)
      redirect_to @chapter.book, notice: I18n.t('shared.updated', resource: Chapter.model_name.human)
    else
      render :edit
    end
  end

  # DELETE /chapters/1
  def destroy
    @chapter.destroy
    redirect_to @chapter.book, notice: I18n.t('shared.destroyed', resource: Chapter.model_name.human)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chapter
      @chapter = Chapter.find(params[:id])
    end

    def set_book
      @book = Book.find(params[:book_id])
    end

    # Only allow a trusted parameter "white list" through.
    def chapter_params
      params.require(:chapter).permit(:title, :number, :book_id)
    end
end
