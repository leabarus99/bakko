class ActivitiesController < ApplicationController
  def activity_params
    params.require(:activity).permit(:name, :category_key)
  end
end
