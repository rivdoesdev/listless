class Permission < ApplicationRecord
  belongs_to :user
  belongs_to :list
  has_one :owner, through: :list, source: :user
  has_many :tasks, through: :lists

  validates :user_id, presence: true
  validates :list_id, presence: true

  def self.for_user(user)
    Permission.joins(:list).where("lists.user_id = ?", user)
  end

end
