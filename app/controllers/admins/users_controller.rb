class Admins::UsersController < ApplicationController

	def index
		@users = User.page(params[:page]).reverse_order.per(10)
		@search = @users.ransack(params[:q])
	    # 検索結果
	    @result = @search.result

	    @users_result = @result.page(params[:page]).per(10)
	end

	def edit
		@user = User.find(params[:id])

	end

	def update
		@user = User.find(params[:id])
		if @user.update
		   redirect_to admins_path
		else
		   render "edit"
		end

	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to admins_users_path
	end

	private

	def search_params
	    params.require(:q).permit!
	end

end
