class User < ApplicationRecord
  include Clearance::User

  has_many :lists
  has_many :tasks, through: :lists

  has_many :allaccesses
  #User giving access
  has_many :users_with_access, through: :allaccesses, source: :assignee
  #User has been given access
  has_many :assigned_users, through: :allaccesses, source: :user

  has_many :permissions
  has_many :permitted_lists, through: :permissions, source: :list

  has_attached_file :avatar, styles: { medium: "250x250>", thumb: "100x100>" }, default_url: "icon.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  validates :name, presence: true
  validates :email, presence: true

  def self.search(query)
    where("name ~* '.*#{query}.*'")
  end

  def started?(list)
    so = Startover.find_by(list: list, user: self, completed: false)
    return false if so.nil?
    !so.completed?
  end
end
