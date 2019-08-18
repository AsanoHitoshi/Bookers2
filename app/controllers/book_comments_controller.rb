class BookCommentsController < ApplicationController
	def create
		book = Book.find(params[:book_id])
		book_comment = BookComment.new(book_comment_params)
		book_comment.user_id = current_user.id
		book_comment.book_id = book.id
		book_comment.save
		redirect_to books_path
	end

	def edit
		@book = Book.find(params[:book_id])
		@book_comment = BookComment.find(params[:id])
		if current_user.id == @book_comment.user_id
		else
			redirect_to book_path(book_comment.user_id)
		end
	end
	def update
		@book_comment = BookComment.find(params[:id])
		@book_comment.update(book_comment_params)
		redirect_to book_path(id: @book_comment.book_id)
	end
	def destroy
		@book_comment = BookComment.find(params[:id])
		@book_comment.destroy
		redirect_to book_path(id: @book_comment.book_id)
	end

	private
	def book_comment_params
		params.require(:book_comment).permit(:user_id,
                      :content,
                      :book_id)
	end


end
