class Organization < ApplicationRecord
  has_many :projects, dependent: :destroy
  has_many :users, dependent: :destroy

  validates :domain, presence: true, uniqueness: true
end
