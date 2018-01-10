class GenresController < ApplicationController
    before_action :authenticate_user!
    
    def index
      @genres = Genre.all
    end
    
    def show
      @genre = Genre.find(params[:id]) 
    end
    
    def new
      @genre = Genre.new
    end
    
    def create
      @genre = Genre.new(genre_params)
      @genre.save
    end
    
    private
    
    def genre_params
      params.require(:genre).permit(:name, books_attributes: [:id, :title, :author, :year, :description])
    end

end
