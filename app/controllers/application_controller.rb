class ApplicationController < ActionController::Base
    before_action :set_current_user
    
    def set_current_user
        if session[:user_id]
            Current.user = User.find_by(id: session[:user_id])
        end
    end

    def require_user_logged_in!
        redirect_to sign_in_path, alert: "Sign in to Complete Action!" if Current.user.nil?
    end

    def setsessionelectionid
        session[:election_id] = nil
    end
end
