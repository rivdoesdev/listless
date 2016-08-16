class Permission < ApplicationRecord
  belongs_to :user
  belongs_to :list
  has_many :tasks, through: :lists
end
