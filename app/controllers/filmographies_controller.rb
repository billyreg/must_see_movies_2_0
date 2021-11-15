class FilmographiesController < ApplicationController
  before_action :set_filmography, only: [:show, :edit, :update, :destroy]

  # GET /filmographies
  def index
    @filmographies = Filmography.all
  end

  # GET /filmographies/1
  def show
  end

  # GET /filmographies/new
  def new
    @filmography = Filmography.new
  end

  # GET /filmographies/1/edit
  def edit
  end

  # POST /filmographies
  def create
    @filmography = Filmography.new(filmography_params)

    if @filmography.save
      redirect_to @filmography, notice: 'Filmography was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /filmographies/1
  def update
    if @filmography.update(filmography_params)
      redirect_to @filmography, notice: 'Filmography was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /filmographies/1
  def destroy
    @filmography.destroy
    message = "Filmography was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to filmographies_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_filmography
      @filmography = Filmography.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def filmography_params
      params.require(:filmography).permit(:movie_id, :director_id)
    end
end
