class User < ApplicationRecord
  include Clearance::User

  has_many :lists
  has_many :tasks, through: :lists

  has_many :allaccesses
  #User giving access
  #User has been given access

  validates :name, presence: true
  validates :email, presence: true
end
