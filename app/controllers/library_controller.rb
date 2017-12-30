require 'pry'

class LibraryController < ApplicationController
   before_action :authenticate_user!
   helper_method :my_library
  
  def show
    @my_library = Library.find(params[:id])
    @rented_books = @my_library.user.books.find_all {|book| book.rented == true}
    @owned_books = @my_library.user.books.find_all {|book| book.rented == false}
  end
end
