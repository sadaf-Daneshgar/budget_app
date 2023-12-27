class ExpensesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @category = Category.find(params[:category_id])
    @expenses = @category.expenses
  end

  def new
    @user = User.find(params[:user_id])
    @category = Category.find(params[:category_id])
    @expense = Expense.new
    @categories = Category.all
  end

  def create
    @user = User.find(params[:user_id])
    @category = Category.find(params[:category_id])
    @expense = @category.expenses.build(expense_params)

    if @expense.save
      redirect_to user_category_expenses_path(@user, @category), notice: 'Expense was successfully created.'
    else
      @categories = Category.all
      render :new
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:category_id, :name, :amount, :transaction_date)
  end
end
