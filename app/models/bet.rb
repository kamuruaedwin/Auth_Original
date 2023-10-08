# app/models/bet.rb
class Bet < ApplicationRecord
  belongs_to :user

  # Validation rules for the Bet model
  validates :stake_amount, presence: true, numericality: { greater_than_or_equal_to: 8 }
  validates :predicted_y_value, presence: true, numericality: { greater_than_or_equal_to: 8 }
  validate :stake_amount_less_than_or_equal_to_balance

  # Method to calculate the outcome
  def calculate_outcome(last_y_value)
    if last_y_value >= predicted_y_value
      stake_amount * predicted_y_value
    else
      0
    end
  end

  private

  def stake_amount_less_than_or_equal_to_balance
    if stake_amount.to_i > user.balance
      errors.add(:stake_amount, "cannot be greater than your balance")
    end
  end
end
