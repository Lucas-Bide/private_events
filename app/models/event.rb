class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :events_users, foreign_key: :attended_event_id
  has_many :attendees, through: :events_users

  validates :name, :description, :date, presence: true
  validates :name, uniqueness: true
  #validates :date, format: {/[01]\d\/[0123]\d\/\d{4}/}
end
