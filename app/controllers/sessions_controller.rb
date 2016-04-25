class SessionsController < ApplicationController

  #take the username and the password and confirm that this is a user on my site
  def create
    username = params[:username]
    password = params[:password]
    waiter = Waiter.find_by username: username
    if waiter && waiter.authenticate(password)
      session[:waiter_id] = waiter.id
      redirect_to waiter_path(waiter.id)
    else
      redirect_to root_path
    end
  end

  def destroy
    session[:waiter_id] = nil
    redirect_to root_path
  end

end #end of sessions controller
