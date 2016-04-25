class CustomersController < ApplicationController

  include SessionsHelper

  before_action :authenticate!, only: [:profile]

  def index
    @customers = Customer.all
  end

  def create
    customer = Customer.create customer_params
    redirect_to new_customer_path
  end

  def new
    @customer = Customer.new
    @table = Table.all
  end

  def show
    @customer = Customer.find params[:id]
  end

#Cant remove the assocition between the table and the waiter
  def destroy
    Customer.destroy params #[not sure what to put in the params]
    redirect_to customers_path
  end


private

def customer_params
  params.require(:customer).permit(:name, :table_id, :order_id)
end



end #End of customers controller
