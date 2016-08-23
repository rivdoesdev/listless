class StartoverList < ApplicationRecord
  belongs_to :user
  belongs_to :list

  validates :completed, default: false, inclusion: { in: [true, false] }
  validates :archived, default: false, inclusion: { in: [true, false] }
  validates :user_id, presence: true
  validates :list_id, presence: true
end
