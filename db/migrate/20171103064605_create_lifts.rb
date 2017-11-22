class CreateLifts < ActiveRecord::Migration[5.1]
  def change
    create_table :lifts do |t|
      t.date :date
      t.string :liftname
      t.boolean :ismetric, default: false
      t.integer :weightlifted, default: 0
      t.integer :repsperformed, default: 0
      t.integer :onerm, default: 0

      t.timestamps
    end
  end
end
