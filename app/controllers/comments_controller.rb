require 'pry'

class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_book


    def index
      @book = Book.find(params[:book_id])
      @comments = @book.comments.all

      render json: @comments, status: 200
    end

    def show
      render 'comments/index', :layout => false
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

       respond_to do |format|
        format.html do
          flash[:success] = 'Comment posted.'
          redirect_to book_path(@book)
        end
         format.js do
           render :json => @comment
         end
       end
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
        params.require(:comment).permit(:body, :user_id, :book_id)
    end

    def set_book
      @book = Book.find(params[:book_id])
    end
end
