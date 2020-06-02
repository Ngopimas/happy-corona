class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :location
      t.date :date
      t.integer :duration
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
