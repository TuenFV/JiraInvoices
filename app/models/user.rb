class User < ApplicationRecord
  has_many :worklogs
  has_many :issues
  belongs_to :organization
end
