class CreateWalls < ActiveRecord::Migration[6.0]
  def change
    create_table :wall_walls, id: :uuid do |t|
      t.string :name, null: false
      t.integer :priorities_count, null: false, default: 10

      t.boolean :archved, null: false, default: false

      t.boolean :is_infinity, null: false, default: true
      t.datetime :end_at, null: true

      t.timestamps
    end
  end
end
