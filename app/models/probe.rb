class Probe < ActiveRecord::Base
  attr_accessible :host, :location

  has_many :load_test_results

  def options
    {
      :host => host,
      :user => 'josh'
    }
  end
end
