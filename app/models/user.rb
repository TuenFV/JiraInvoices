class User < ApplicationRecord
  has_many :worklogs
  belongs_to :organization
end
