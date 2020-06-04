class User < ApplicationRecord
  has_many :creations, class_name: 'Event', foreign_key: :creator_id
  has_many :invitations, class_name: 'Event', foreign_key: :guest_id

  validates :username, uniqueness: true, presence: true
end
