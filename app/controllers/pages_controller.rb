class PagesController < ApplicationController
  def home
  end

  def profil
    @story = Story.new
    @story.trip = @trip
    @user = current_user
    # @user_story = @trip.current_user.story
    @stories = Story.all
  end

  def journal
    @user_stories = current_user.stories
    @stories = Story.all
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
