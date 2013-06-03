require 'eventmachine'

class LoadTest < ActiveRecord::Base
  attr_accessible :status, :interval, :duration, :host, :port
  has_many :load_test_results
  after_create :start

  def start
    update_attributes(:status => 1)

    Probe.all.each do |probe|
      delay.start_probe(probe)
    end
  end

  def options
    {
      :host => host,
      :port => port,
    }
  end

  def start_probe(probe)
    EM.run do
      @start_time = Time.now.to_i

      runner = Camb::Runner.new(:probe => probe.options, :test => self.options)
      timer = EM::PeriodicTimer.new(interval) do
        data = runner.run.to_s
        result = JSON.parse(data)
        result.merge!(:probe_id => probe.id)
        load_test_results.create!(result)

        if Time.now.to_i - @start_time > duration
          EM.stop
          update_attributes(:status => 2)
        end
      end
    end
  end
end
