class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  
  def github
    @user = User.from_omniauth_github(request.env["omniauth.auth"])
    redirect_to api_v1_articles_path
    #sign_in_and_redirect @user 
  end

  def google_oauth2
    @user = User.from_omniauth_google_oauth2(request.env["omniauth.auth"])
    #sign_in_and_redirect @user
    redirect_to api_v1_articles_path
  end

  def twitter
    @user = User.from_omniauth_twitter(request.env["omniauth.auth"])
    sign_in_and_redirect @user
  end

  def facebook
    @user = User.from_omniauth_facebook(request.env["omniauth.auth"])
    #sign_in_and_redirect @user
    redirect_to api_v1_articles_path
  end

  def passthru
    redirect_to api_v1_articles_path
  end

  def failure
    redirect_to api_v1_articles_path
  end

end              