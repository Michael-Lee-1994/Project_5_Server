class CreateTvShows < ActiveRecord::Migration[6.0]
  def change
    create_table :tv_shows do |t|
      t.string :title
      t.string :genre
      t.string :plot
      t.string :poster
      t.string :length

      t.timestamps
    end
  end
end
