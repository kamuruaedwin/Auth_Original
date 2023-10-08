class CreateAnimations < ActiveRecord::Migration[7.1]
  def change
    create_table :animations do |t|
      t.float :last_y_value
      t.string :animation_hash

      t.timestamps
    end
  end
end
