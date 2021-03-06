class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    auth_hash = request.env["omniauth.auth"]
    @user = User.from_omniauth(auth_hash)

    if @user.persisted?
      sign_in_and_redirect @user

      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      
      session["devise.facebook_data"] = auth_hash
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to root_path
  end
end