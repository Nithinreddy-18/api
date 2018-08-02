module Api
	module V1
		class SessionsController < ApplicationController
		  
		  def create
			@user = User.where(email: params[:email]).first
			if @user&.valid_password?(params[:password])
			 #render json: @user.as_json(only: [:email, :authentication_token]), status: :created
			 render :create, status: :created
			else
			 head(:unauthorized)
			end
		  end

		  def destroy
		  	@user = User.where(email: params[:email])
		  end
		end
	end
end