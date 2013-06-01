class TestResult < ActiveRecord::Base
  attr_accessible :timestamp, :total_time

  belongs_to :test
end
