class Issue < ApplicationRecord
  belongs_to :project
  belongs_to :user, optional: true
  has_many :worklogs, dependent: :destroy
end
