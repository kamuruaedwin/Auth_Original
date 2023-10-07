# app/controllers/sessions_controller.rb

class SessionsController < ApplicationController

    def new
    end


    def create
      if user = User.authenticate_by(phone_number: params[:phone_number], password: params[:password])
          login user
          redirect_to root_path, notice: "You have logged in successfully"
        
      else
        flash[:alert] = "invalid phone number or password."
        render :new, status: :unprocessable_entity
      end

    end

    def destroy
      reset_session
      # logout current_user
      redirect_to root_path, notice: "You Have been logged out successfully"
    end
end
