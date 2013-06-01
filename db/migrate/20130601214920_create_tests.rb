class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.string :host
      t.integer :port
      t.integer :duration

      t.timestamps
    end
  end
end
