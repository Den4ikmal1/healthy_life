class ApplicationController < ActionController::Base
  
  protect_from_forgery with: :exception

  helper_method :account_url

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up) do |user_params|
    user_params.permit(:first_name, :last_name, :gender, :position, :email, :password, :password_confirmation)
  end
end

   def account_url
      return new_user_session_url unless user_signed_in?
      case current_user.class.name
      when 'Coach'
        edit_coach_registration_url
      else
        root_url
      end if user_signed_in?
   end
end