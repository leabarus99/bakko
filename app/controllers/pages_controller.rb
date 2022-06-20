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

  def detailedbudget
    @budgets = Budget.all
    @user = current_user
    @budget = Budget.find(params[:id])
    @budget_by_category = Budget.by_category(@budget.trip.activities, @budget.price)
  end
end
