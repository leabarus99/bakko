class BudgetsController < ApplicationController
  # before_action :authenticate_user!
  # skip_before_action :authenticate_user!, only: :home

  def index
    @budgets = Budget.all
  end

  def show
    @budget = Budget.find(params[:id])
  end

  def new
    @budget = Budget.new
  end

  def create
    @budget = Budget.new(budget_params)
    if @budget.save
      redirect_to budgets_path(@budget)
    else
      render :new
    end
    authorize @budget
  end

  private

  def budget_params
    params.require(:budget).permit(:price, :category, :trip)
  end
end
