class LoadTestResult < ActiveRecord::Base
  attr_accessible :probe_id, :timestamp, :total_time

  belongs_to :load_test
  belongs_to :probe
end
