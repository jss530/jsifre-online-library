require 'pry'

class CommentsController < ApplicationController
    before_action :authenticate_user!
    
    def show
    end
    
    def new
      @book = Book.find(params[:book_id])
      @comment = @book.comments.new
    end
    
    def create
     @book = Book.find(params[:book_id])
     @comment = @book.comments.new(comment_params)
     @comment.user_id = current_user.id

     if @comment.save
       flash[:success] = "Your comment has been added!"
       redirect_to book_path(@book)
     else
       flash[:try_again] = "Something went wrong - please try again."
       redirect_to book_path(@book)
     end
    end
    
    
    def destroy
      @book = Book.find(params[:book_id])
      @comment = @book.comments.find(params[:id])
      @comment.destroy

      redirect_to book_path(@book)
    end
    
    private
    
    def comment_params
        params.require(:comment).permit(:body, :user_id, :book_id, :commenter)
    end
end
