class PagesController < ApplicationController
  def home
  end

  def profil
    @user = current_user
  end
end
