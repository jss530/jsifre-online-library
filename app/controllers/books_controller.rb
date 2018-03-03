require 'pry'

class BooksController < ApplicationController
    before_action :authenticate_user!

    def index
    end

    def show
     @book = Book.find(params[:id])
    end

    def new
     @book = Book.new
    end

    def edit
     @book = Book.find(params[:id])
    end

    def create
     @book = Book.new(book_params)
     if @book.save
       @book.update(user_id: current_user.id, owner_number: current_user.id)
       current_user.owned_books << @book
       flash[:success] = "Your book has been added!"
       redirect_to library_path(current_user.id)
     else
       flash[:try_again] = "Something went wrong - please try again."
       render action: 'new'
     end
    end

    def update
     @book = Book.find(params[:id])

     if @book.update(book_params)
       flash[:update_success] = "Your book has been updated!"
       redirect_to library_path(current_user.id)
     else
       flash[:try_again] = "Something went wrong - please try again."
       render action: 'edit'
     end
    end

    def destroy
     @book = Book.find(params[:id])
     @book.destroy

     flash[:success] = "#{@book.title} has been deleted."
     redirect_to library_path(current_user.id)
    end

    def borrow
     @book = Book.find(params[:id])
     @book.user_id = current_user.id
     @book.borrow
     flash[:success] = "Book added to your rentals!"
     redirect_to library_path(current_user.id)
    end

    def return_book
     @book = Book.find(params[:id])
     @book.return_book
     flash[:success] = "Book has been returned!"
     redirect_to library_path(current_user.id)
    end

    private

    def book_params
      params.permit(:title, :image, :author, :year, :description, :genre_id, :genres_attributes => [:id, :name])
    end

end
