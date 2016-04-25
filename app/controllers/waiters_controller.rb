class WaitersController < ApplicationController

  include SessionsHelper

  before_action :authenticate!, only: [:profile]

  def index
    @waiters = Waiter.all
  end

  def new
    @waiter = Waiter.new
  end

  def create
    waiter = Waiter.create waiter_params
    redirect_to root_path waiter.id
  end

  def edit
    @waiter = Waiter.find params[:id]
  end

  def show
    @waiter = Waiter.find params[:id]
  end

  def update
    waiter = Waiter.find params[:id]
    waiter.update waiter_params
    redirect_to waiters_path waiter.id
  end

  def destroy
    Waiter.destroy params[:id]
    redirect_to root_path
  end

  def profile
    # authenticate!
    @waiter = current_waiter
  end

private

def waiter_params
  params.require(:waiter).permit(:username, :password, :password_confirmation)
end



end #End of waiter controller
