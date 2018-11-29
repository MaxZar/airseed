class IdeasController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_idea, only: [:update, :show, :edit, :destroy]

  skip_after_action :verify_authorized
  skip_after_action :verify_policy_scoped

  def new
    @idea = Idea.new
    authorize @idea
  end

  def create
    @idea = Idea.new(idea_params)
    @idea.user = current_user

    if @idea.save
      redirect_to idea_path(@idea)
    else
      render :new
    end
  end

  def edit
    authorize @idea
  end

  def update
    authorize @idea
    if @idea.update(idea_params)
     redirect_to idea_path(@idea)
    else
     render :edit
    end
  end

  def show
  end

  def index
    @ideas = policy_scope(Idea).order(created_at: :desc)

    @ideas_map = Idea.where.not(latitude: nil, longitude: nil)
    @markers = @ideas_map.map do |idea|
      {
        lng: idea.longitude,
        lat: idea.latitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { idea: idea })
      }
    end
  end

  def destroy
    authorize @idea
    @idea.destroy
    redirect_to ideas_path
  end

  def search
  end

  private

  def set_idea
    @idea = Idea.find(params[:id])
  end

  def idea_params
     params.require(:idea).permit(
      :user_id,
      :title,
      :description,
      :category,
      :revenue_model,
      :pricing,
      :start_date,
      :end_date,
      :minimum_duration,
      :application_criteria,
      :photo,
      :photo_cache
      )
  end
end
