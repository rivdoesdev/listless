class List < ApplicationRecord
  belongs_to :user
  has_many :tasks
  has_many :permissions
  has_many :allowed_users, through: :permissions, source: :user

  validates :title, length: { minimum: 2, maximum: 200 }
  validates_inclusion_of :difficulty, :in => 1..5
  validates_inclusion_of :energy, :in => 1..5
  validates :user_id, presence: true

  after_create :reminder

  @@REMINDER_TIME = 30.minutes

  def users_without_permission
    User.all - self.allowed_users
  end

  def self.search(query)
    where("title ~* '.*#{query}.*'")
  end

  def completed?(user)
    so = Startover.find_by(user: user, list: self)
    so && so.completed?
  end

  def reminder
    twilio_number = ENV['TWILIO_NUMBER']
    client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
    reminder = "Hi #{self.user.name}! Just a reminder that your list #{self.title} is due at #{time}."
    message = client.account.messages.create(
      :from => twilio_number,
      :to => user.phone_number,
      :body => reminder
   )
   puts message.to
  end

  def when_to_run
    time - @@REMINDER_TIME
  end
end
