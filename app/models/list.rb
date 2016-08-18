class List < ApplicationRecord
  belongs_to :user
  has_many :tasks
  has_many :permissions
  has_many :allowed_users, through: :permissions, source: :user

  validates :title, length: { minimum: 2, maximum: 200 }
  validates_inclusion_of :difficulty, :in => 1..5
  validates_inclusion_of :energy, :in => 1..5
  validates :completed, default: false, inclusion: { in: [true, false] }
  validates :user_id, presence: true

  def users_without_permission
    User.all - self.allowed_users
  end
end
