class UsersController < ApplicationController
	def show
		@user=User.find(params[:id])
	end

	def new
		@user=User.new()
	end

	def create
		@user=User.new(user_params)
		if @user.save
			# titulo=full_title
			sign_in(@user)
			flash[:success] = "Bem vindo ao #{$base_name}!"
			redirect_to @user
		else
			render 'new'
		end
	end

	private
	def user_params
		params.require(:user).permit(:nome, :email, :password, :password_confirmation)
	end

end

