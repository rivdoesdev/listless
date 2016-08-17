class Permission < ApplicationRecord
  belongs_to :user
  belongs_to :list
  has_many :tasks, through: :lists

  validates :user_id, uniqueness: { scope: [:user_id] }
  validates :list_id, presence: true
end
