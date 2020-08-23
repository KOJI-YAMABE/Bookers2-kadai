class BooksController < ApplicationController
 skip_before_action :authenticate_user!, only: [:top, :about]
  #before_action :logged_in__user, only: [:edit, :update, :destroy]

	def top
	end

	def about
	end

	def show
		@book = Book.find(params[:id])
		@user = @book.user
		@bookpost = Book.new
	end

	def index
		@bookpost = Book.new
		@books = Book.all
	end

	def create
		   @bookpost = Book.new(book_params)
		   @bookpost.user_id = current_user.id
		if
			@bookpost.save
		    redirect_to book_path(@bookpost), notice: 'You have creatad book successfully.'
	   else
	   	    @books = Book.all
  		    render 'index'
	    end
	end

	def edit
		@book = Book.find(params[:id])
		if current_user.id != @book.user_id
	    redirect_to books_path
        end
	end

	def update
		   @book = Book.find(params[:id])
		if
			@book.update(book_params)
		    redirect_to book_path(@book), notice: 'You have creatad book successfully.'
		else
			@books = Book.all
            render "edit"
	    end
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to books_path
	end

	private
	def book_params
		params.require(:book).permit(:title, :body, :user_id)
	end
end

