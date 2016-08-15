class Task < ApplicationRecord
  belongs_to :list

  validates :title, length: { minimum: 2, maximum: 200 }
  validates :description, length: { minimum: 2, maximum: 200 }
  validates :completed, default: false, inclusion: { in: [true, false] }
  validates :list_id, presence: true
end
