require 'pry'

class LibraryController < ApplicationController
   before_action :authenticate_user!
   helper_method :my_library
  
  def show
    @my_library = Library.find(params[:id])
    #binding.pry
    @rented_books = @library.user.books.find_by rented:true
    @owned_books = @library.user.books.find_by rented:false
  end
end
