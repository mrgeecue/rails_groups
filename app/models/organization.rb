class Organization < ApplicationRecord
  belongs_to :user
  has_many :members, dependent: :destroy 
  has_many :joined_users, through: :members, source: :user
  validates :name, presence: true, :length => { :minimum => 5 }, :uniqueness => { :case_sensitive => false }
  validates :description, presence: true, :length => { :minimum => 10 }
end
