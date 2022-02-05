class EventsController < ApplicationController

	def index
	end

	def new
		@event = Event.new
	end

	def create
		@event = Event.new(event_params)
		if @event.save
			flash[:notice] = "Alert was saved"
		else
			flash[:error] = "Alert was saved"

		end
		redirect_to root_path
	end


	def event_params
		params.require(:event).permit(:name)
	end

end
