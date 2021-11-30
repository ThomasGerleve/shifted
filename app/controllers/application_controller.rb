class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: :home
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_up_background_image, if: :homepage?

  def homepage?
    # return unless user_signed_in?
    helpers.current_page?(controller: :pages, action: :home)
    # end
  end

  def set_up_background_image
    @page_container_class_name = "page-container-opacity"
  end

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name experience_level functional_role_id additional_infos])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name experience_level functional_role_id additional_infos])
  end
end
