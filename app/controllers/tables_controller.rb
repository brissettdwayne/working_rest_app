class TablesController < ApplicationController

  include SessionsHelper

  before_action :authenticate!, only: [:profile]

  def index
    @tables = Table.all
    @table = Table.new
    @waiters = Waiter.all
  end

  def create
    table = Table.create table_params
    redirect_to tables_path
  end

  def new
    @table = Table.new
  end

  def edit
    @table = Table.find params[:id]
  end

  def show
    @table = Table.find params[:id]
  end

  # def update
  #   table = Table.find params[:id]
  #   table.update waiter_id:current_waiter.id
  #   redirect_to table_path table.id
  # end

  def assign
    table = Table.find_by(table_num: params[:table_num])
    table.update waiter_id: current_waiter.id
    redirect_to waiter_path(current_waiter.id)
  end

#Cant remove the assocition between the table and the waiter
  def destroy
    Table.destroy params[waiter_id: current_waiter.id]
    redirect_to waiters_path
  end


private

def table_params
  params.require(:table).permit(:table_num, :waiter_id)
end



end #End of tables controller
