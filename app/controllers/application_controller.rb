class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login

  private

  def require_login
  	unless current_user
  		authenticate_user!
  	end
  end
end
