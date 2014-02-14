class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :get_referrer
    def get_referrer
      session[:referrer] ||= params[:referrer]
    end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
end
