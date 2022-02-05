class ApplicationController < ActionController::Base
	add_flash_types :info, :error, :warning
	devise_group :user, contains: [:admin, :agent]

	def after_sign_in_path_for(resource)
	  root_path 
	end


end
