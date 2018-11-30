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
    @marker =
      [{
        lng: @idea.longitude,
        lat: @idea.latitude
      }]
    # @marker = @marker.select do |e|
    #   e[:lng] || e[:lat]
    # end
  end

  def index
    @cat = [
      'Arts, crafts, and collectibles',
      'Beauty and fragrances',
      'Books and magazines',
      'Education',
      'Electronics and telecom',
      'Entertainment and media',
      'Food retail and service',
      'Gifts and flowers',
      'Government',
      'Health and personal care',
      'Home and garden',
      'Pets and animals',
      'Services - other',
      'Sports and outdoors',
      'Travel',
      ]

    if params[:query].present?
      @ideas_pre = Idea.search_by_title_and_category_and_description(params[:query])
    else
      @ideas_pre = Idea.all
    end

    @ideas = []

    @ideas_pre.each do |idea|
      c1 = params[:category].present? && idea.category ? idea.category == params[:category] : true
      c2 = params[:max_price].present? && idea.pricing ? idea.pricing < params[:max_price].to_i : true
      c3 = true
      idea.bookings.to_a.each do |b|
        if params[:start_date].present? && params[:end_date].present?
          c3 = false if b.start_date < Date.parse(params[:end_date]) && b.end_date > Date.parse(params[:start_date])
        end
      end
      @ideas << idea if c1 && c2 && c3
    end

    @markers = @ideas.map do |idea|
      {
        lng: idea.longitude,
        lat: idea.latitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { idea: idea })
      }
    end
    @markers = @markers.select do |e|
      e[:lng] || e[:lat]
    end
  end

  def destroy
    authorize @idea
    @idea.destroy
    redirect_to ideas_path
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
