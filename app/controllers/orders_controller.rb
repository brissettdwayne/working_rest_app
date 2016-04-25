class OrdersController < ApplicationController

  include SessionsHelper

  before_action :authenticate!, only: [:profile]

  def index
    @table     = Table.find(params[:table_id])
    @orders    = @table.orders
    @customers = Customer.all
    @foods     = Food.all
  end

  def create
    order = Order.create order_params
    redirect_to table_orders_path
  end

  def new
    @order     = Order.new
    @customers = Customer.all
    @foods     = Food.all
  end

  def edit
    @order = Order.find params[:id]
  end

  def show
    @order = Order.find params[:id]
  end

  def update
    order = Order.find params[:id]
    Order.update #Again not sure what to put in here
    redirect_to table_path order.id
  end

#Cant remove the assocition between the Order and the waiter
  def destroy
    Order.destroy params #Not sure what to put in params
    redirect_to waiters_path
  end


private

  def order_params
    params.require(:order).permit(:customer_id, :food_id)
  end



end #End of tables controller
