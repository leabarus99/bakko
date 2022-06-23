class LiikesController < ApplicationController
  before_action :find_story, except: [:destroy]

  def create
    if already_liked?
      flash[:notice] = "You can't like more than once"
    else
      @story.liikes.create(user_id: current_user.id)
    end
    after_like_action
  end

  def already_liked?
    Liike.where(user: current_user, story_id: params[:story_id].to_i).exists?
  end

  def after_like_action
    @div_content = render_to_string partial: 'all_header', locals: { story: @story }
    respond_to do |format|
      format.html { redirect_to journal_path }
      format.js
    end
  end

  def destroy
    @liike = Liike.find(params[:id])
    @story = @liike.story
    @liike.destroy
    after_like_action
  end

 private

 def find_story
   @story = Story.find(params[:story_id])
 end

end
