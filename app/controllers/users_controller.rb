class UsersController < ApplicationController
	before_action :authenticate_user!,only: [:new,:edit,:show,:update,:create,:index]
	def new
		@user=User.new
	end
	def edit
		@user = User.find(params[:id])
		if current_user.id == @user.id
		else
			flash[:notice] = "error"
			redirect_to user_path(current_user.id)
		end
	end
	def show
		@user = User.find(params[:id])
		@books = Book.where(user_id: params[:id])
		@book = Book.new
	end
	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
      		flash[:notice] = "User was successfully updated."
  	  		redirect_to user_path(@user.id)
    	else
    		flash[:notice] = "error"
      		redirect_to user_path(@user.id)
    	end
	end
	def create
		@user = User.new(user_params)
		if @user.save
			flash[:notice]="User was successfully created."
			redirect_to user_path(@user.id)
		else
			flash[:notice] = "error"
			redirect_to user_path(@user.id)
		end
	end
	def index
		@users =User.all
		@book = Book.new
		@user = User.find(current_user.id)
	end

	private
	def user_params
		params.require(:user).permit(:name,:email,:password,:profile_image,:introduction)
	end
end
