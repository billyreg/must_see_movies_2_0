class FilmographiesController < ApplicationController
  before_action :set_filmography, only: %i[show edit update destroy]

  def index
    @q = Filmography.ransack(params[:q])
    @filmographies = @q.result(distinct: true).includes(:movie,
                                                        :director).page(params[:page]).per(10)
  end

  def show; end

  def new
    @filmography = Filmography.new
  end

  def edit; end

  def create
    @filmography = Filmography.new(filmography_params)

    if @filmography.save
      message = "Filmography was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @filmography, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @filmography.update(filmography_params)
      redirect_to @filmography, notice: "Filmography was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @filmography.destroy
    message = "Filmography was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to filmographies_url, notice: message
    end
  end

  private

  def set_filmography
    @filmography = Filmography.find(params[:id])
  end

  def filmography_params
    params.require(:filmography).permit(:movie_id, :director_id)
  end
end
