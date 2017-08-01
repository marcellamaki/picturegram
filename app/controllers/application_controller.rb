class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :this_user, :logged_in?
    #before_action :current_user

    # def home
    # end

    def authorize_user
      if !logged_in?
        redirect_to root_path
      end
    end

    def this_user
      @this_user ||= User.find_by(id: session[:user_id])
    end

    def logged_in?
      !!this_user
    end

end
