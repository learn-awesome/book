class DashboardController < ApplicationController
  include Secured

  def show
  end

  def message
  	msg = params[:message]
  	current_user.message = msg
  	if current_user.save
  		flash[:notice] = "Your message has been saved. Thank you once again!"
  		redirect_to '/dashboard'
  	else
  		flash[:notice] = "Something went wrong. We will look into this."
  		redirect_to '/dashboard'
  	end
  end
end
