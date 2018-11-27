class BookingsController < ApplicationController
  def new
    @idea = Idea.find(params[:idea_id])
    @booking = Booking.new(idea: @idea)
  end

  def create
    @idea = Idea.find(params[:idea_id])
    @booking = Booking.new(booking_params)
    @booking.idea = @idea
    @booking.user = current_user
      if @booking.save
        render :show
      else
        render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to booking_path(@booking)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :request_message, :validated)
  end
end
