class Games < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.string :datetime
      t.string :location
      t.integer :tilt_amount
      t.integer :host
    end
  end
end
