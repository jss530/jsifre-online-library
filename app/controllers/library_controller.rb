require 'pry'

class LibraryController < ApplicationController

  def show
      if current_user.library
        @my_library = current_user.library
      else
        current_user.create_library
        @my_library = current_user.library
        binding.pry
      end

    if user_signed_in? && current_user.id == @my_library.user_id
        @rented_books = @my_library.user.rented_books
        @owned_books = @my_library.user.owned_books
    else
        flash[:sign_in_needed] = "Please sign in."
        redirect_to root_path
    end
  end

end
