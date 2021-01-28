class UserShowSerializer < ActiveModel::Serializer
  attributes :id, :favorite, :currently_watching, :current_episode, :media
  has_one :user
  has_one :media
end
