class IdeasController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_idea, only: [:update, :show, :edit, :destroy]

  def new
    record.user == user
    record.user == user
    @idea = Idea.new
  end

  def create
    record.user == user
    @idea = Idea.new(idea_params)
    if @idea.save
      redirect_to idea_path(@idea)
    else
      render :new
    end
  end

  def edit
  end

  def update
    record.user == user
    if @idea.update(idea_params)
     redirect_to idea_path(@idea)
    else
     render :edit
    end
  end

  def show
  end

  def index
    @ideas = Idea.all
  end

  def destroy
    record.user == user
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
      :minimum_application_duration,
      :application_criteria,
      :photo
      )
  end
end
