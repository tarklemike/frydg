class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :first_name, :last_name, :address, :postcode, :image])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :first_name, :last_name, :address, :postcode, :image])
  end

  def after_sign_in_path_for(resource)
    # Use the route helper for the user's show action, which is the profile page.
    # Assuming `resource` has an `id` that corresponds to the user's id.
    user_path(resource)
  end
end
