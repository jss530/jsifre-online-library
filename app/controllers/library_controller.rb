class LibraryController < ApplicationController
   before_action :authenticate_user!
  
  def show
    @library = Library.find(params[:id])
    
    @rented_books = current_user.books.find_by rented:true
    @owned_books = current_user.books.find_by rented:false
  end
end
