class BudgetsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: :home

  def index
    @budgets = Budget.all
  end

  def show
    @budget = Budget.find(params[:id])
    @budget_by_category = Budget.by_category(@budget.trip.activities, @budget.price)
  end

  def new
    @trip = Trip.find(params[:trip_id])
    @budget = Budget.new
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @budget = Budget.new(budget_params)
    @budget.trip = @trip
    if @budget.save
      redirect_to trip_budget_path(@trip, @budget)
    else
      render :new
    end
  end

  private

  def budget_params
    params.require(:budget).permit(:price, :category, :trip)
  end
end
