class AuthenticationsController < ApplicationController

  def index
    @authentications = current_user.authentications.all
  end

  def logged_in(authentication)
    flash[:notice] = "Logged in Successfully"
    sign_in_and_redirect User.find(authentication.user_id)
  end

  def link(token, token_secret)
    omni = request.env["omniauth.auth"]

    current_user.authentications.create!(
      provider: omni['provider'],
      uid: omni['uid'],
      token: token,
      token_secret: token_secret
    )

    flash[:notice] = "Authentication successful."
    sign_in_and_redirect current_user
  end

  def facebook
    omni = request.env["omniauth.auth"]
    authentication = Authentication.find_by_provider_and_uid(
      omni['provider'], 
      omni['uid'])

    if authentication
      logged_in(authentication)
    elsif current_user
      token = omni["credentials"].token
      token_secret = ""
      link(token, token_secret)
    else
      user = User.new
      user.email = omni['extra']['raw_info'].email
      
      user.apply_omniauth(omni)
      user.save()
     
      flash[:notice] = "Logged in."
      sign_in_and_redirect User.find(user.id)
    end
  end

  def twitter
    omni = request.env["omniauth.auth"]
    authentication = Authentication.find_by_provider_and_uid(
      omni["provider"], 
      omni["uid"])
    
    if authentication
      logged_in(authentication)
    elsif current_user
      token = omni["credentials"].token
      token_secret = omni["credentials"].secret
      link(token, token_secret)
    else 
      session[:omniauth] = omni.except('extra')
      redirect_to new_user_registration_path
    end
  end

  def destroy
    @authentication = Authentication.find(params[:id])
    @authentication.destroy
    redirect_to authentications_url, :notice => "Successfully destroyed authentication."
  end
end
