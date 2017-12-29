
class LibraryController < ApplicationController
   before_action :authenticate_user!
  
  def show
    @library = Library.find(params[:id])
    @rented_books = @library.user.books.find_by rented:true
    @owned_books = @library.user.books.find_by rented:false
  end
end
