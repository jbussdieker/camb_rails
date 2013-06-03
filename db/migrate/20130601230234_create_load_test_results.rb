class CreateLoadTestResults < ActiveRecord::Migration
  def change
    create_table :load_test_results do |t|
      t.integer :load_test_id
      t.integer :timestamp, :limit => 8
      t.integer :probe_id
      t.float :total_time

      t.timestamps
    end
  end
end
