class Issue < ApplicationRecord
  belongs_to :project
  has_many :worklogs, dependent: :destroy
end
