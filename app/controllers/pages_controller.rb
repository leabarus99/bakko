class PagesController < ApplicationController
  def home
  end

  def profil
    @user = current_user
  end

  def journal
    @stories = Story.all
  end

  def story
    @story = Story.create
  end
end
