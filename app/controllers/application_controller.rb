class ApplicationController < ActionController::Base
    before_action :authenticate_user!

  def index
    @categories=Category.all
   end
  end
