module SessionsHelper

    def authenticate!
      redirect_to root_path unless current_waiter
    end

    def current_waiter
      @current_waiter = Waiter.find session[:waiter_id]
    end

end
