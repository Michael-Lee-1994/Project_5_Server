class UserShowSerializer < ActiveModel::Serializer
  attributes :id, :favorite, :currently_watching, :current_episode
  has_one :user
  has_one :review
  has_one :media
end
