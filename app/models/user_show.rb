class UserShow < ApplicationRecord
  belongs_to :user
  has_many :reviews
  belongs_to :media, polymorphic: true

  validates :media_id, uniqueness: {scope: :user_id}
end
