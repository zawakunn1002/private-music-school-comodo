class Admins::NoticesController < ApplicationController

	def show
		@notice = Notice.find(params[:id])
		@admin = 1
		@favorite = @notice.favorites.page(params[:page]).reverse_order.per(10)
	end

end
