class TransactionsController < ApplicationController
  before_action :set_user

  def index
    @transactions = Transaction.all
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = @user.transactions.new(transaction_params)

    if @transaction.save
      redirect_to user_transactions_path(@user), notice: 'Transaction was successfully created.'
    else
      render :new
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:name, :amount, :category_id)
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
