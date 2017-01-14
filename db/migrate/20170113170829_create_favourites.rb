class CreateFavourites < ActiveRecord::Migration[5.0]
  def change
    create_table :favourites do |t|
      t.references :favourable, polymorphic: true
      t.references :user, foreign_key: true

      t.timestamps
    end

    add_index :favourites, [:favourable_id, :favourable_type, :user_id], unique: true, name: 'unique_favourite'
  end
end
