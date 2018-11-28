class BookingsController < ApplicationController
    skip_after_action :verify_authorized
    skip_after_action :verify_policy_scoped
    before_action :set_booking, only: [:edit, :show, :update, :accept, :decline]

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

  def accept
    @booking.validated = true
    @booking.save
    redirect_to users_show_path
  end

  def decline
    @booking.validated = false
    @booking.save
    redirect_to users_show_path
  end

  def show
  end

  def edit
  end

  def update
    @booking.update(booking_params)
    redirect_to booking_path(@booking)
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :request_message, :validated)
  end
end
