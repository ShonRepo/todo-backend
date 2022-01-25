class CreateUser < ActiveRecord::Migration[6.0]
  def change
    create_table :user_users, id: :uuid do |t|
      t.string(:full_name, null: false)
      t.string(:email, null: false)
      t.string(:encrypted_password, null: false)

      t.timestamps
    end

    create_table :user_refresh_tokens, id: :uuid do |t|
      t.string(:token, null: false)
      t.datetime(:expires_at, null: false)

      t.references(:user,
                   type: :uuid,
                   index: true,
                   null: false,
                   dependent: :destroy,
                   foreign_key: { to_table: :user_users, on_delete: :cascade })

      t.index(:token, unique: true)
    end

    create_table :user_walls, id: :uuid do |t|
      t.references(:user,
                   type: :uuid,
                   index: true,
                   null: false,
                   dependent: :destroy,
                   foreign_key: { to_table: :user_users, on_delete: :cascade })

      t.references(:wall,
                   type: :uuid,
                   index: true,
                   null: false,
                   dependent: :destroy,
                   foreign_key: { to_table: :wall_walls, on_delete: :cascade })
    end

    reversible do |dir|
      dir.up do
        execute <<~'SQL'
          CREATE UNIQUE INDEX index_users_on_email
          ON user_users (lower(email));
        SQL

        execute <<~'SQL'
          ALTER TABLE user_users
            ADD CONSTRAINT user_email_format_must_be_valid
            CHECK (email ~ '^[а-яА-яa-zA-Z0-9.!#$%&''*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$');
          SQL
        end
      dir.down do
        execute <<~SQL
          ALTER TABLE user_users
          DROP CONSTRAINT user_email_format_must_be_valid;
        SQL

        execute <<~'SQL'
          DROP INDEX index_users_on_email;
        SQL
      end
    end
  end
end
