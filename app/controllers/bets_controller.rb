# app/controllers/bets_controller.rb
class BetsController < ApplicationController
  before_action :set_user, only: [:create]
  before_action :initialize_last_y_value, only: [:create]
  def new
    @bet = Bet.new
  end

  def create
    # Simulate the animation's progress (replace this with your actual animation logic)
    @bet = current_user.bets.build(bet_params)
    
    if @bet.save

      #deduct stake_amount from balance on placing bet
      current_user.balance -= @bet.stake_amount

      # Calculate the outcome based on animation progress and predicted value
      if @last_y_value >= @bet.predicted_y_value
        @bet.outcome = @bet.stake_amount * @bet.predicted_y_value
        flash[:success] = "Congratulations you won!" 
      else
        @bet.outcome = 0
      end

      # Update the user's balance based on the outcome
      current_user.balance += @bet.outcome
      current_user.save

      flash[:success] = "Bet placed successfully!"
      redirect_to root_path
    else
      render :new
    end
  end

  private 

  def set_user
    @user = current_user
  end

  
  def initialize_last_y_value
    @last_y_value = 1  # Initialize with the starting value (modify as needed)
  end

  def bet_params
    params.require(:bet).permit(:stake_amount, :predicted_y_value)
  end
end
