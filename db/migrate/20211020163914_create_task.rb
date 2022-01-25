class CreateTask < ActiveRecord::Migration[6.0]
  def change
    create_table :task_tasks, id: :uuid do |t|
      t.string(:title, null: false)
      t.boolean(:is_complete, null: false, default: true)

      t.integer(:priority, null: false)
      t.boolean(:is_infinity, null: false, default: true)
      t.datetime(:end_at, null: true)

      t.boolean(:archved, null: false, default: false)

      t.references(:group,
                   type: :uuid,
                   index: true,
                   null: false,
                   dependent: :destroy,
                   foreign_key: { to_table: :group_groups, on_delete: :cascade })

      t.integer(:move_falied, null: true)
      t.references(:faled_move,
                   type: :uuid,
                   index: true,
                   null: false,
                   dependent: :destroy,
                   foreign_key: { to_table: :group_groups, on_delete: :cascade })

      t.integer(:move_completed, null: true)
      t.references(:completed_move,
                   type: :uuid,
                   index: true,
                   null: false,
                   dependent: :destroy,
                   foreign_key: { to_table: :group_groups, on_delete: :cascade })
    end
  end
end
