class StoriesController < ApplicationController
  before_action :authenticate_user!
  def index
    @stories = Story.all
  end

  def show
    @story = Story.find(params[:id])
    @user = @story.trip.user
    @pseudo = @user.first_name + " " +@user.last_name
  end

  def new
    @story = Story.new
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

  def all
    @stories = Story.all
  end

  private

  def story_params
    params.require(:story).permit(:content, :photo, :title, :video, :location, :trip, :description, :introduction, :part_number)
  end
end
