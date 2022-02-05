class EventsController < ApplicationController

	def index
		@events = Event.all
	end

	def new
		@event = Event.new
	end

	def create
		@event = Event.new(event_params)
		if @event.save
			flash[:notice] = "Event was saved"
		else
			flash[:error] = "Event was not saved. #{@event.errors.full_messages.to_sentence}"
		end
		redirect_to root_path
	end


	def event_params
		params.require(:event).permit(:name)
	end

end
