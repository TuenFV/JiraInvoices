class Issue < ApplicationRecord
  belongs_to :project
  belongs_to :user
  has_many :worklogs, dependent: :destroy
end
