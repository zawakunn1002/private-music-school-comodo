class AdminsController < ApplicationController

	def index
        @admin = Admin.find(1)
        @notices = Notice.page(params[:page]).reverse_order.per(10)

	end


    def edit
        @admin = Admin.find(1)

    end

    def update
        @admin = Admin.find(1)
        if @admin.update(admin_params)
           redirect_to admins_path
        else
           render "edit"
        end

    end

    private

    def admin_params
        params.require(:admin).permit(:id, :email, :name, notice_attributes:(:id))

    end

end
