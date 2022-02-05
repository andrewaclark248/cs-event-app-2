class EventsController < ApplicationController


	def index
		@events = Event.order("start_time ASC")
	end

	def new
		@event = Event.new
	end

	def create
		planner = User.find_by(id: event_params[:planner].to_i)
		@event = Event.new(event_params.except(:planner, :image))
		@event.planner = planner
		@event.image.attach(io: event_params[:image].tempfile, filename: "xyz.pdf", content_type: "application/pdf")  if event_params[:image].present? 

		if @event.save
			flash[:notice] = "Event was saved"
		else
			flash[:error] = "Event was not saved. #{@event.errors.full_messages.to_sentence}"
		end
		redirect_to root_path
	end

	def edit
		@event = Event.find_by(id: params[:id])
	end

	def update
		planner = User.find_by(id: event_params[:planner].to_i)
		@event = Event.find_by(id: params[:id])
		@event.planner = planner
		@event.image.attach(io: event_params[:image].tempfile, filename: "xyz.pdf", content_type: "application/pdf")  if event_params[:image].present? 

		if @event.update(event_params.except(:planner))
			flash[:notice] = "Event was updated."
		else
			flash[:error] = "Event was not updated. #{@event.errors.full_messages.to_sentence}"
		end
		redirect_to root_path
	end


	private 
		def event_params
			params.require(:event).permit(:name, :planner, :star, :favorite, :image, :start_time, :end_time)
		end

end
