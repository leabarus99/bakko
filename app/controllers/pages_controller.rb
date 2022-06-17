class PagesController < ApplicationController
  def home
  end

  def profil
    @user = current_user
  end

  def journal
    @stories = Story.all
    @story = Story.new
    @users = User.all
    @user = current_user
  end

  def story
    @story = Story.create
  end

end
