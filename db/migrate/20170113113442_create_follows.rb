class CreateFollows < ActiveRecord::Migration[5.0]
  def change
    create_table :follows do |t|
      t.references :followee, foreign_key: { to_table: :users }
      t.references :follower, foreign_key: { to_table: :users }

      t.timestamps
    end

    add_index :follows, [:followee_id, :follower_id], unique: true
  end
end
