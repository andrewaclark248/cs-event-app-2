class ApplicationController < ActionController::Base
	add_flash_types :info, :error, :warning
	devise_group :user, contains: [:admin, :agent]
	skip_before_action :verify_authenticity_token  

	def after_sign_in_path_for(resource)
	  root_path 
	end


end
