class BooksController < ApplicationController
    before_action :authenticate_user!
    
    def show
     @book = Book.find(params[:id]) 
    end
    
    def borrow
     @book.user_id = current_user.id
     @book.availability = false
     @book.save
     
     #redirect_to library_path
    end
  
end
