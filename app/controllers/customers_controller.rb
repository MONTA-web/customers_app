class CustomersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :show, :edit, :aggregate_result]
  before_action :set_customer, only: [:show, :edit, :update, :redirect_to_home, :destroy]
  before_action :redirect_to_home, only: [:show, :edit, :update]
  before_action :search_product, only: [:index, :search, :aggregate_result, :aggregate_search]
  def index
    customers = @p.result
    @customers = customers.where(user_id: current_user.id).order(created_at: :DESC)
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      flash[:notice] = '登録が完了しました。'
      redirect_to root_path
    else
      render action: :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @customer.update(customer_params)
      flash[:notice] = '編集が完了しました。'
      redirect_to customers_path
    else
      render :edit
    end
  end

  def destroy
    @customer.destroy
    flash[:notice] = '削除が完了しました。'
    redirect_to customers_path
  end

  def search
    @results = @p.result.order(created_at: :DESC)
  end

  def aggregate_result
    @aggregate = @p.result
    @results = @aggregate.where(user_id: current_user.id).where('amount_money > ?',1).group('YEAR(purchase_date)').group('MONTH(purchase_date)').sum(:amount_money)
  end

  def aggregate_search
    @aggregate = @p.result
    @results = @aggregate.where(user_id: current_user.id).where('amount_money > ?',1).group('YEAR(purchase_date)').group('MONTH(purchase_date)').sum(:amount_money)
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone, :product_name, :amount_money, :start_time, :purchase_date, :remark_column).merge(user_id: current_user.id)
  end

  def redirect_to_home
    redirect_to root_path unless @customer.user_id == current_user.id
  end

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def search_product
    @p = Customer.ransack(params[:q])
  end
end
