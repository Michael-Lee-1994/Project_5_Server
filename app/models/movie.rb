class Movie < ApplicationRecord
    has_many :user_shows, as: :media, dependent: :destroy
    has_many :users, through: :user_shows

    validates :title, uniqueness: true
end
