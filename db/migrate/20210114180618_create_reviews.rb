class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :notes, default: ""
      t.references :user_show, null: false, foreign_key: true
      t.timestamps
    end
  end
end
# default: ""