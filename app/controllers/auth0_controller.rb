class Auth0Controller < ApplicationController
  def callback
    # This stores all the user information that came from Auth0 and the IdP

    # session[:userinfo] = request.env['omniauth.auth']
    # .delete_if { |k,v| k.to_s == "extra" }

    if request.env['omniauth.auth'].present?
      user = User.find_or_create_by(uid: request.env['omniauth.auth']["uid"]) do |u|
        u.userinfo = request.env['omniauth.auth'].to_json
      end
      session[:user_id] = user.id
      # Redirect to the URL you want after successful auth
      redirect_to '/dashboard'
    end
  end

  def failure
    # show a failure page or redirect to an error page
    @error_msg = request.params['message']
  end
end
