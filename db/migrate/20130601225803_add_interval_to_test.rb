class AddIntervalToTest < ActiveRecord::Migration
  def change
    add_column :tests, :interval, :float
  end
end
