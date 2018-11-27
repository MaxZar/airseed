class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  skip_before_action :authenticate_user!, only: :index
  skip_after_action :verify_authorized
  skip_after_action :verify_policy_scoped

  def show
    @ideas = Idea.where(user_id: @user.id)
    @bookings = Booking.where(user_id: @user.id)

  end

  def edit

  end

  def update
  end

  def destroy
  end

  def index
  end

  private

  def user_params
    params.require(:user).permit(
      :id,
      :photo,
      :first_name,
      :last_name,:email,:description
      )
  end
  def set_user
    @user = User.find(params[:id])
  end
end
