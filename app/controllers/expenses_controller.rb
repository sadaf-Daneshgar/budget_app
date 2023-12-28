class ExpensesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @category = Category.find(params[:category_id])
    @expenses = @user.expenses.where(category: @category)
  end

  def new
    @user = User.find(params[:user_id])
    @category = Category.find(params[:category_id])
    @expense = Expense.new
    @categories = Category.all
  end

  def create
    @user = User.find(params[:user_id])
    @category = Category.find(params[:expense][:category_id])
    @expense = @category.expenses.build(expense_params)
    @expense.author = @user

    if @expense.save
      redirect_to user_category_expenses_path(@user, @category), notice: 'Expense was successfully created.'
    else
      @categories = Category.all
      render :new
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount, :transaction_date, :category_id)
  end
end
