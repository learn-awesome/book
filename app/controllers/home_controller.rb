class HomeController < ApplicationController
  def show
  	if user_signed_in?
  		#redirect_to '/dashboard'
  	end
  end
end
