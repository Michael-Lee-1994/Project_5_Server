class UserShowSerializer < ActiveModel::Serializer
  attributes :id, :favorite, :currently_watching, :current_episode, :media, :reviews
  has_one :user
  has_one :media
  has_many :reviews
end
