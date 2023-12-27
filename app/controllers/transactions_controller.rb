class TransactionsController < ApplicationController
  before_action :set_user
  before_action :set_category

  def index
    @transactions = @category.transactions
    @total_amount = @transactions.sum(:amount)
  end

  def new
    @transaction = @category.transactions.new
  end

  def create
    @transaction = @category.transactions.new(transaction_params)
    if @transaction.save
      redirect_to user_category_transactions_path(@user, @category), notice: 'Transaction created successfully.'
    else
      render :new
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_category
    @category = Category.find(params[:category_id])
  end

  def transaction_params
    params.require(:transaction).permit(:name, :amount)
  end
end
