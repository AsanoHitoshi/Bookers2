class FollowsController < ApplicationController
	def new
		follow = current_user.follows.new(follow_id: params[:user_id])
		follow.save
		redirect_to user_path(params[:user_id])
	end

	def destroy
		follow = Follow.find_by(follow_id: params[:user_id], user_id: current_user.id)
		follow.destroy
		redirect_to user_path(params[:user_id])
	end

	def follow_index
		@follows = Follow.where(user_id: params[:user_id])
	end

	def follower_index
		@follows = Follow.where(follow_id: params[:user_id])
	end


end
