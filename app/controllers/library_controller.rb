require 'pry'

class LibraryController < ApplicationController

  def show
      @my_library = Library.find_or_create_by(:user_id => current_user.id)
      
    if user_signed_in? && current_user.id == @my_library.user_id
        @rented_books = @my_library.user.rented_books
        @owned_books = @my_library.user.owned_books
    else
        flash[:sign_in_needed] = "Please sign in."
        redirect_to root_path
    end
  end

end
