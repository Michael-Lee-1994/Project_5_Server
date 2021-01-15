class AnimeSerializer < ActiveModel::Serializer
  attributes :id, :title, :status, :age_rating, :posterImage, :episode_count, :episode_length
end
