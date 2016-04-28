class MediaController < ApplicationController
  before_action :set_medium, only: [:show, :edit, :update, :destroy]
  before_action :set_book, only: %i(index)
  skip_before_action :require_login, only: :show

  # GET /media
  def index
    @media = if @book
               @book.media
             else
               Medium.all
             end

    if params[:changed_since]
      @media = @media.where('media.updated_at >= ?', params[:changed_since])
    end

    respond_to do |format|
      format.html {}
      format.json { render json: @media }
    end
  end

  # GET /media/1
  def show
    respond_to do |format|
      format.html {}
      format.json { render json: @medium }
    end
  end

  # GET /media/new
  def new
    @medium = medium_class.new
  end

  # GET /media/1/edit
  def edit
  end

  # POST /media
  def create
    @medium = medium_class.new(medium_params)

    if @medium.save
      redirect_to media_url, notice: I18n.t('shared.created', resource: Medium.model_name.human)
    else
      render :new
    end
  end

  # PATCH/PUT /media/1
  def update
    if @medium.update(medium_params)
      redirect_to media_url, notice: I18n.t('shared.updated', resource: Medium.model_name.human)
    else
      render :edit
    end
  end

  # DELETE /media/1
  def destroy
    @medium.destroy
    redirect_to media_url, notice: I18n.t('shared.destroyed', resource: Medium.model_name.human)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_medium
    @medium = Medium.find(params[:id])
  end

  def set_book
    @book = Book.find(params[:book_id]) if params[:book_id]
  end

  # Only allow a trusted parameter "white list" through.
  def medium_params
    params.require(:medium).permit(
      :chapter_id,
      :type,
      :title_de,
      :title_en,
      :teaser_de,
      :teaser_en,
      :thumbnail,
      :file,
      :movie1,
      :movie2,
      :description1_de,
      :description1_en,
      :description2_de,
      :description2_en,
    )
  end

  def medium_class
    if valid_type_given?
      @medium = params[:type].constantize
    else
      @medium = Medium
    end
  end

  def valid_type_given?
    %w(Movie TwoMoviesAndText).include? params[:type]
  end
end
