class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :genre, :plot, :poster, :length
end
