class User < ApplicationRecord
  include Clearance::User

  has_many :lists
  has_many :tasks, through: :lists

  has_many :allaccesses
  #User giving access
  has_many :users_with_access, through: :allaccesses, source: :assignee
  #User has been given access
  has_many :assigned_users, through: :allaccesses, source: :user

  validates :name, presence: true
  validates :email, presence: true
end
