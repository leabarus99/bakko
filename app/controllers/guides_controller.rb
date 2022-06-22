class GuidesController < ApplicationController
  def index
    @guide = Guide.all

    if params[:query].present?
      @guides = @guide.search_by_title_and_category(params[:query])
    else
      @guides = Guide.all
    end
  end

  def show
    @guide = Guide.find(params[:id])
  end

  def guide_params
    params.require(:guide).permit(:title, :content, :author, :category, :difficulty, :photo)
  end
end
