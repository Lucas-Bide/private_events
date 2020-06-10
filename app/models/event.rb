class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :events_users, foreign_key: :attended_event_id
  has_many :attendees, through: :events_users

  validates :name, :description, :date, presence: true
  validates :name, uniqueness: true
  validates :date, presence: true

  scope :upcoming, -> { where("date >= ?", Date.today) }
  scope :past, -> { where("date < ?", Date.today) }

  def date_valid?
    valid = true
    message = 'Date must be as shown on the left.'
    if date =~ /^(0[1-9]|1[012])\/(0[1-9]|[12][0-9]|3[01])\/(19|20)\d\d/
      dates = date.split('/')
      if (dates[1] == '31') && (dates[0] == '02' || dates[0] == '06' || dates[0] == '09' || dates[0] == '11')
        valid = false
        message = "That month doesn't have a 31st."
      elsif (dates[1].to_i >= 30) && (dates[0] == '02')
        valid = false
        message = "February doesn't have a 30th."
      elsif (dates[0] == '02') && !(dates[2].to_i % 4 == 0 && (dates[2].to_i % 100 != 0 || dates[2].to_i % 400 == 0))
        valid = false
        message = "That's not a leap year."
      end
    else
      valid = false
      year = date[date.index('/', date.index('/') + 1) + 1, date.length-1].to_i
      message = "Year goes from 1900 to 2099." if year > 2099 || year < 1900
    end
    if !valid && !date.empty?
      errors.add(:date, message)
    end
  end

end