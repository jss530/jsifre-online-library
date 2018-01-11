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
      if @genre.save
        @genre.books.first.update(user_id: current_user.id, owner_number: current_user.id)
        flash[:success] = "Your genre and book have been added!"
        redirect_to genre_path(@genre)
      else
        flash[:success] = "Something went wrong. Please try again."
        render action: 'new'
      end
    end

    private
    
    def genre_params
      params.require(:genre).permit(:name, books_attributes: [:id, :title, :author, :year, :description])
    end

end
