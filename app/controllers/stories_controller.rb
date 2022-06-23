class StoriesController < ApplicationController
  before_action :authenticate_user!

  def show
    @story = Story.find(params[:id])
    @user = @story.trip.user
    @pseudo = @user.first_name + " " +@user.last_name
  end

  def new
    @story = Story.new
    @trip = Trip.find(params[:trip_id])
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @story = Story.new(story_params)
    @story.trip = @trip
    @user = @story.trip.user
    if @story.save
      redirect_to journal_path(@story)
    else
      render :new
    end
  end

  def destroy
    @story= Story.find(params[:id])
    @story.destroy
    redirect_to journal_path
  end

  def index
    @stories = Story.all.order(created_at: :desc)
    if params[:query].present?
      @stories = @stories.search_by_title_and_location(params[:query])
    end
  end

  private

  def story_params
    params.require(:story).permit(:content, :photo, :title, :video, :location, :trip, :description, :introduction, :part_number)
  end
end
