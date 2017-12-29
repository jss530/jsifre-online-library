class BooksController < ApplicationController
    before_action :authenticate_user!
    
    def show
     @book = Book.find(params[:id]) 
    end
    
    def borrow
     @book = Book.find(params[:id]) 
     @book.user_id = current_user.id
     @book.inventory - 1
     @book.save
     
     redirect_to library_path
    end
  
end
