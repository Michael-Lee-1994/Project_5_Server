class UserShow < ApplicationRecord
  belongs_to :user
  belongs_to :review
  belongs_to :media, polymorphic: true
end
