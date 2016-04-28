class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  skip_before_action :require_login, only: :index
  before_action :require_login, only: :index, unless: ->(controller) { controller.request.format.json? }

  # GET /books
  def index
    @books = Book.all
    respond_to do |format|
      format.html {}
      format.json { render json: @books }
    end
  end

  # GET /books/1
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to @book, notice: I18n.t('shared.created', resource: Book.model_name.human)
    else
      render :new
    end
  end

  # PATCH/PUT /books/1
  def update
    if @book.update(book_params)
      redirect_to @book, notice: I18n.t('shared.updated', resource: Book.model_name.human)
    else
      render :edit
    end
  end

  # DELETE /books/1
  def destroy
    @book.destroy
    redirect_to books_url, notice: I18n.t('shared.destroyed', resource: Book.model_name.human)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def book_params
      params.require(:book).permit(:title_en, :title_de, :author, :description_en, :description_de, :image)
    end
end
