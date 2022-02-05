class AppUsersController < ApplicationController

	def index
		@users = User.all
	end

end
