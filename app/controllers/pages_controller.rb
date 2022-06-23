class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:journal, :destroy, :create, :profil]
  def home
  end

  def profil
    @story = Story.new
    @story.trip = @trip
    @stories = current_user.stories
    @most_liked_story = @stories.max do |story_a, story_b|
      story_a.liikes.count <=> story_b.liikes.count
    end
    @user = current_user
    @like_stories = Liike.where(user: current_user).map(&:story)
  end

  def journal
    # @trip = Trip.find(params[:trip_id])
    @story = Story.new
    @story.trip = @trip
    @stories = Story.all
    @user_stories = current_user.stories
  end

  def story
    @story = Story.create
  end

  def destroy
    @story= Story.find(params[:id])
    @story.destroy
    redirect_to journal_path
  end

  def create
    @liike = current_user.liikes.new(liike_params)
    if !@liike.save
      redirect_to @like.story
    end
  end

  def destroyy
    @liike = current_user.liikes.find(params[:id])
    @story = @liike.story
    @liike.destroy
    redirect_to story
  end

  def your_action
    @authenticity_token = form_authenticity_token
  end

  private

  def story_params
    params.require(:story).permit(:content, :photo, :title, :video, :location, :trip, :description, :introduction, :part_number)
  end

  def liike_params
    params.require(:liike).permit(:story_id, :user_id)
  end


  def detailedbudget
    @budgets = Budget.all
    @user = current_user
    @budget = Budget.find(params[:id])
    @budget_by_category = Budget.by_category(@budget.trip.activities, @budget.price)
  end



end
