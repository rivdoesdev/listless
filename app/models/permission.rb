class Permission < ApplicationRecord
  belongs_to :user
  belongs_to :list
  has_many :tasks, through: :lists

  validates :all_access, inclusion: { in: [ true, false ] }, default: false
  validates :user_id, uniqueness: { scope: [:id] }
  validates :list_id, presence: true
end
