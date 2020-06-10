class User < ApplicationRecord
  has_many :creations, class_name: 'Event', foreign_key: :creator_id
  has_many :events_users, foreign_key: :attendee
  has_many :attended_events, through: :events_users

  validates :username, uniqueness: true, presence: true

#  scope :upcoming, -> { where(date)}
end
