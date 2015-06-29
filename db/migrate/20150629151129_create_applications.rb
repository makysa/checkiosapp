class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :title
      t.string :url
      t.string :saved_version

      t.timestamps
    end
  end
end
