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
    @stories = Story.all
  end

  def create
    @story = Story.new(story_params)
    @stories = Story.all
    if @story.save
      redirect_to story_path(@story)
    else
      render :new
    end
    authorize @story
  end

  def all
    @stories = Story.all
  end

  private

  def story_params
    params.require(:budget).permit(:content, :photo, :title, :video, :location, :trip)
  end
end
