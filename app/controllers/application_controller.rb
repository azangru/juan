class ApplicationController < ActionController::Base
  protect_from_forgery

  #######THIS IS TO MAKE RANSACK WORK IN NAVBAR
  # (pretty horrible, if you ask me)

  before_filter :set_global_search_variable

  def set_global_search_variable
    @q = StanzaTranslation.search(params[:q])
  end

  ############################

end
