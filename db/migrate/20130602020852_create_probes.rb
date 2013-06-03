class CreateProbes < ActiveRecord::Migration
  def change
    create_table :probes do |t|
      t.string :location
      t.string :host

      t.timestamps
    end
  end
end
