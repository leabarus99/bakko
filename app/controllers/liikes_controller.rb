class LiikesController < ApplicationController
before_action :set_story

  def create
    @story.liikes.create(user_id: current_user.id)
    redirect_to journal_path
  end

  def destroy
    # @liike = Liike.find(params[:id])
    @liike = current_user.liikes.find(params[:id])
    @story = @liike.story
    @liike.destroy
    redirect_to @story
  end

  private

  def story_params
    params.require(:story).permit(:content, :photo, :title, :video, :location, :trip, :description, :introduction, :part_number)
  end

  def liike_params
    params.require(:liike).permit(:story_id, :user_id)
  end

  def set_story
    @story = Story.find(params[:story_id])
  end
end
