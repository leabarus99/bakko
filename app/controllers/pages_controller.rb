class PagesController < ApplicationController
  def home
  end

  def profil
    @user = current_user
  end

<<<<<<< HEAD
  def journal
    @stories = Story.all
  end

  def story
    @story = Story.create
  end

=======
  def yourbudget
    Budget.by_category([Activity.last, Activity.first], params[:budget])


  end
>>>>>>> 5cb0629ebb140cf3e156568ca1b1b4979f0331bd
end
