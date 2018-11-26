class BookingsController < ApplicationController
  def new
    @idea = Idea.find(params[:idea_id])
    @booking = Booking.new(idea: @idea)
  end

  def create
    @idea = Idea.find(params[:idea_id])
    @booking = Booking.new(booking_params)
    @booking.idea = @idea
    if @booking.save
      redirect_to idea_path(@idea)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :request_message)
  end
end
