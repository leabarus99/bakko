class GuidesController < ApplicationController
  def index
    @guide = Guide.all

    if params[:query].present?
      @guides = @guides.search_by_title_and_category(params[:query])
    else
      @guides = Guide.all
    end
  end

  def show
    @guide = Guide.find(params[:id])
  end
end
