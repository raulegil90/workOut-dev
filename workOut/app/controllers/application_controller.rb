class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :require_login, :except => :index						# do not require to login before the home page

  def index
  	# displays home content
  end

  protected
  def not_authenticated
  	redirect_to login_path, :alert => "Please login first"
  end
end
