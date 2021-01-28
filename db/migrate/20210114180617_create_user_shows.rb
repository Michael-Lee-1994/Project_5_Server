class CreateUserShows < ActiveRecord::Migration[6.0]
  def change
    create_table :user_shows do |t|
      t.boolean :favorite
      t.boolean :currently_watching
      t.integer :current_episode
      t.references :user, null: false, foreign_key: true
      t.references :media, polymorphic: true, null: false

      t.timestamps
    end
  end
end
