class FavoritesController < ApplicationController

	def create
		@notice = Notice.find(params[:notice_id])
		@favorite = current_user.favorites.build(notice_id: params[:notice_id])
    	@favorite.save

	end

	def destroy
		@notice = Notice.find(params[:notice_id])
		@favorite = Favorite.find_by(notice_id: @notice, user_id: current_user.id)
    	@favorite.destroy

	end
end
