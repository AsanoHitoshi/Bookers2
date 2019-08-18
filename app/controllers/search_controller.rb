class SearchController < ApplicationController
	def search
		model = params[:search_model]
		method = params[:search_method]
		word = params[:search_word]
		@model = model
		if model == "User"
			@users = User.search(method,word)
		elsif model =="Book"
			@books = Book.search(method,word)
		else
		end
	end
end
