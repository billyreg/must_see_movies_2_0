class Api::V1::FilmographiesController < Api::V1::GraphitiController
  def index
    filmographies = FilmographyResource.all(params)
    respond_with(filmographies)
  end

  def show
    filmography = FilmographyResource.find(params)
    respond_with(filmography)
  end

  def create
    filmography = FilmographyResource.build(params)

    if filmography.save
      render jsonapi: filmography, status: 201
    else
      render jsonapi_errors: filmography
    end
  end

  def update
    filmography = FilmographyResource.find(params)

    if filmography.update_attributes
      render jsonapi: filmography
    else
      render jsonapi_errors: filmography
    end
  end

  def destroy
    filmography = FilmographyResource.find(params)

    if filmography.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: filmography
    end
  end
end
