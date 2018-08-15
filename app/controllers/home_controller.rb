class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    # render plain: current_user.inspect
    # User.new params
  end

  # def generate_token
  #   self.token = SecureRandom.urlsafe_base64
  #   generate_token if User.exists?(token: self.token)
    
  # end

end