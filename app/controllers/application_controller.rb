class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_current_user 

  def after_sign_in_path_for(resource_or_scope)
    root_path
  end

  protected

    def authenticated_user!
      store_origin_path
      authenticate_user!
    end

    def admin?
      self.admin == true
    end

    def adminfunc
      redirect_to new_user_session_path unless current_user && current_user.admin?
    end

    def set_current_user
      Course.current_user == current_user
    end
end
  