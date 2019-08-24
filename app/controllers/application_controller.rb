class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?

	def after_sign_in_path_for(resourse)
		case resourse

		when User
		user_path(current_user)

	    when Admin
	    admins_path

	    end
	end

	def after_sign_out_path_for(resourse)
		root_path
	end

	protected
    def configure_permitted_parameters
    	if params['controller'] == 'users/registrations'
    	devise_parameter_sanitizer.permit(:sign_up, keys:[:cellphone_number, user_children_attributes:[:name_kanji_sei, :name_kanji_mei, :name_kana_sei, :name_kana_mei]])

        elsif params['controller'] == 'admins/registrations'
    	devise_parameter_sanitizer.permit(:sign_up, keys: [:name])

        end

    end

end
