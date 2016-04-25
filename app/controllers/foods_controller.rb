class FoodsController < ApplicationController

  include SessionsHelper

  before_action :authenticate!, only: [:profile]

  def create
    food = Food.create(customer_params)
    redirect_to new_food_path
  end

  def new
    @food = Food.new
    @table = Table.all
  end

#Cant remove the assocition between the table and the waiter
  def destroy
    Food.destroy params#[not sure what to put in the params]
    redirect_to customers_path
  end


private

def customer_params
  params.require(:food).permit(:name, :price, :order_id)
end



end #End of customers controller
