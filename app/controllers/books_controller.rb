class BooksController < ApplicationController

	before_action :authenticate_user!
	def index
		@book = Book.new
		@books = Book.all
		@user = User.find(current_user.id)
	end
	def show
		@user = User.find(current_user.id)
		@newbook = Book.new
		@book = Book.find(params[:id])
	end
	def edit
		@book = Book.find(params[:id])
		if current_user.id == @book.user_id
		else
			redirect_to books_path
		end
	end
	def destroy
		@book = Book.find(params[:id])
		if current_user.id == @book.user_id
			if @book.destroy
				flash[:notice]="Book was successfully destroyed"
				redirect_to books_path
			else
				flash[:notice]="Don't destroy error"
				redirect_to books_path
			end
		else
			flash[:notice]="error, Book_user is not you"
			redirect_to books_path
		end
	end
	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		if @book.save
			flash[:notice]="Book was successfully created"
			redirect_to book_path(@book.id)
		else
			flash[:notice]="error"
			redirect_to books_path
		end
	end
	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
			flash[:notice]="Book was successfully updated"
			redirect_to book_path(@book.id)
		else
			flash[:notice]="error"
			redirect_to book_path(@book.id)
		end
	end

	private
	def book_params
		params.require(:book).permit(:title,:body)
	end
end
