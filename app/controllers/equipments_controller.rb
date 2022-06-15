class EquipmentsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: :home

  def index
    @equipments = Equipment.all
  end

  def show
    @equipment = Equipment.find(params[:id])
  end
end
