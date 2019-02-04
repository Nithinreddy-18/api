module Api
	module V1
		class SessionsController < ApplicationController
		  
		  def create
			@user = User.where(email: params[:email]).first
			if @user&.valid_password?(params[:password])
			 render json: @user.as_json(only: [:email, :authentication_token]), status: :created
			 #render :create, status: :created
			else
			 head(:unauthorized)
			end
		  end

		  def destroy
		  	@user = User.where(email: params[:email])
		  	render json: @user.as_json(only: [:email]), status: :ok
		  end

		  private
			def session_params
				params.permit(:email)
			end
		end
	end
end


=begin
class UsersController < ApplicationController
skip_before_action :authenticate_request, only: %i[login register]

 # [...]
  def login
    authenticate params[:email], params[:password]
  end
  def test
    render json: {
          message: 'You have passed authentication and authorization test'
        }
  end
 # [...]

 # [...]
  Private
  def authenticate(email, password)
    command = AuthenticateUser.call(email, password)

    if command.success?
      render json: {
        access_token: command.result,
        message: 'Login Successful'
      }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
   end
 # [...]

end
=end
