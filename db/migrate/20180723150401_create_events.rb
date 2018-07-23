class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.string :location
      t.datetime :time
      t.text :description
      t.string :type

      t.timestamps
    end
  end
end
