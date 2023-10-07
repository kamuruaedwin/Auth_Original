# app/controllers/bets_controller.rb

class BetsController < ApplicationController
  def new
    @bet = Bet.new
  end

  def update_outcomes(last_y_value)
    Bet.where(outcome: nil).each do |bet|
      outcome = bet.calculate_outcome(last_y_value)
      bet.update(outcome: outcome)
      current_user.balance += outcome
      current_user.save
    end
  end

  def create
  @bet = current_user.bets.build(bet_params)

  # Simulate the animation's progress (replace this with your actual animation logic)
  animation_progress = simulate_animation_progress

  if @bet.save
    # Calculate the outcome based on animation progress and predicted value
    if animation_progress >= @bet.predicted_y_value
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

  def bet_params
    params.require(:bet).permit(:stake_amount, :predicted_y_value)
  end
end
