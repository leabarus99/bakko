class LiikesController < ApplicationController


  def create
    @liike = current_user.liikes.new(liike_params)
    @story = Story.find(params[:story_id])
    @story = @liike.story
    if @liike.save
      redirect_to root_path
    end
    render @story
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
end
