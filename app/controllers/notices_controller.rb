class NoticesController < ApplicationController

	def new
		@notice = Notice.new

	end

	def create
		@notice = Notice.new(notice_params)
		@notice.admin_id = 1
		if @notice.save
		   redirect_to admins_path
		else
		   render "new"
		end

	end

	def index
		@notices = Notice.page(params[:page]).reverse_order.per(10)

	end

	def show
		@notice = Notice.find(params[:id])
		@admin = 1

	end

	def edit
		@notice = Notice.find(params[:id])

	end

	def update
		@notice = Notice.find(params[:id])
		if @notice.update(notice_params)
		   if user_signed_in?
		   redirect_to user_path(current_user)
		   else
		   redirect_to admins_path
		   end
		else
		   render "edit"
		end

	end

	def destroy
		@notice = Notice.find(params[:id])
		@notice.destroy
		redirect_to admins_path

	end

	private

	def notice_params
		params.require(:notice).permit(:id, :notice_title, :notice_text)
	end
end
