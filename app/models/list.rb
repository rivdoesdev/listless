class List < ApplicationRecord
  belongs_to :user
  has_many :tasks

  validates :title, length: { minimum: 2, maximum: 200 }
  validates :difficulty, presence: true
  validates :energy, presence: true
  validates :completed, default: false, inclusion: { in: [true, false] }
  validates :user_id, presence: true
end
