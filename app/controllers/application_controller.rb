class ApplicationController < ActionController::Base
  before_filter :mailer_set_url_options
  protect_from_forgery

  def mailer_set_url_options
    ActionMailer::Base.default_url_options[:host] = request.host_with_port
  end
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access Denied"
    redirect_to root_url
  end
end
