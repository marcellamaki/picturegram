class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :admin?
    #before_action :current_user

    # def home
    # end

    def authorize_user
      if !logged_in?
        redirect_to root_path
      end
    end

    def current_user
      @user ||= User.find_by(id: session[:user_id])
    end

    def logged_in?
      !!current_user
    end

end
