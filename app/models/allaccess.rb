class Allaccess < ApplicationRecord
  belongs_to :user
  belongs_to :assignee, class_name: "User", foreign_key: "assignee_id"

  validates :user_id, presence: true
  validates :assignee_id, presence: true
end
