class ApplicationController < ActionController::Base
  helper_method :current_author

  before_filter :set_last_action
  after_filter :flashes

  def current_author
    Author.find_by_id session[:author_id]
  end

  def require_author
    unless current_author
      redirect_to login_path, notice: "You must be logged in to go there"
    end
  end

  private

  def set_last_action
  	session[:last_action] = Time.now
  end

  

  def flashes
  	flash[:notice] = session[:last_action].to_s
  end

end
