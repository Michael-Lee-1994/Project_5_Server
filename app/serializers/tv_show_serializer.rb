class TvShowSerializer < ActiveModel::Serializer
  attributes :id, :title, :genre, :plot, :poster, :length
end
