class PagesController < ApplicationController
  def home
  end

  def profil
    @user = current_user
  end

  def yourbudget
    Budget.by_category([Activity.last, Activity.first], params[:budget])


  end
end
