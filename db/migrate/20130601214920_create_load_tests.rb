class CreateLoadTests < ActiveRecord::Migration
  def change
    create_table :load_tests do |t|
      t.string :host
      t.integer :port, :default => 80
      t.integer :duration, :default => 60
      t.float :interval, :default => 1
      t.integer :status, :default => 0

      t.timestamps
    end
  end
end
