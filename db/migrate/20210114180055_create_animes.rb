class CreateAnimes < ActiveRecord::Migration[6.0]
  def change
    create_table :animes do |t|
      t.string :title
      t.string :status
      t.string :age_rating
      t.string :posterImage
      t.integer :episode_count
      t.integer :episode_length

      t.timestamps
    end
  end
end
