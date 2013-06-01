class CreateTestResults < ActiveRecord::Migration
  def change
    create_table :test_results do |t|
      t.integer :test_id
      t.integer :timestamp
      t.float :total_time

      t.timestamps
    end
  end
end
