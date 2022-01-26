class Api::AuthController < CoreController

  # Sign up new users
  def sign_up
    ::User::User.transaction(requires_new: false) do
      user = ::User::User.create!(sign_up_params)

      render json: user.json_for_api()
    end
  end

  private

  def sign_up_params
    params[:user].permit(:full_name, :email, :password)
  end
end