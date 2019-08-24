class UsersController < ApplicationController


	def show
	 	@user = User.find(params[:id])
	 	@child = @user.user_children
	 	@admin = 1

	end

	def edit
		@user = User.find(params[:id])

	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			if
				@user == current_user
				redirect_to user_path(@user.id)
		    else
		    	redirect_to admins_users_path

		    end
		else
		   render "edit"
		end
	end

	private

	def user_params
		params.require(:user).permit(:id, :email, :cellphone_number, :homephone_number, :day, user_children_attributes:[:id,:name_kanji_sei, :name_kanji_mei, :name_kana_sei, :name_kana_mei])
	end


end
