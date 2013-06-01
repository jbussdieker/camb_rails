class Test < ActiveRecord::Base
  attr_accessible :interval, :duration, :host, :port
  has_many :test_results
  after_create :start_test

  def start_test
    delay.start
  end

  def start
    runner = Camb::Runner.new(self)
    start_time = Time.now.to_i
    EM.run do
      timer = EM::PeriodicTimer.new(interval) do
        result = runner.run
        test_results.create!(result)

        if Time.now.to_i - start_time > duration
          EM.stop
        end
      end
    end
  end

  def run
    runner = Camb::Runner.new(self)
    result = runner.run
    [result[:timestamp], result[:total]]
  end
end