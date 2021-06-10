class GenresController < ApplicationController
  def new
    @genre = Genre.new
  end
  def create
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to genres_path
  end

  def index
    @genres = Genre.all
  end

  def show
    @genre = Genre.find(params[:id])
  end

  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    redirect_to genres_path
  end

  def genre_params
    params.require(:genre).permit(:name, :instruction)
  end
end
