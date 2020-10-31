class RegistrationsController < Devise::RegistrationsController
    private
    def sign_up_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end

    def acount_update_params
        params.require(:user).permit(:name, :username, :email, :bio, :birthday, :password, :password_confirmation, :current_password)
    end

    protected
    def update_resource(resource, params)
      # Require current password if user is trying to change password.
      return super if params["password"]&.present?

      # Allows user to update registration information without password.
      resource.update_without_password(params.except("current_password"))
  end
end
