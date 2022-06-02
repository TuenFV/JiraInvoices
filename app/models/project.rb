class Project < ApplicationRecord
  belongs_to :organization
  has_many :issues, dependent: :destroy
end
