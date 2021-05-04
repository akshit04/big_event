class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    include AuthenticationHelper


    def check_login
        if(!session[:user_email].present?)
            flash[:notice] = "User not signed in"
            redirect_to root_path
        end
    end
end