class TopsController < ApplicationController
  skip_before_action :authenticate_user!
  
  def index
    render layout: "logout_layout"
  end
end
