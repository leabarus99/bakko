class LiikesController < ApplicationController
<<<<<<< HEAD


  def create
    @liike = current_user.liikes.new(liike_params)
    @story = Story.find(params[:story_id])
    @story = @liike.story
    if @liike.save
      redirect_to root_path
    end
    render @story
=======
before_action :set_story

  def create
    @story.liikes.create(user_id: current_user.id)
    redirect_to journal_path
>>>>>>> 2530560fa92592722dc9d1161d701d16d68b562e
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
<<<<<<< HEAD
=======

  def set_story
    @story = Story.find(params[:story_id])
  end
>>>>>>> 2530560fa92592722dc9d1161d701d16d68b562e
end
