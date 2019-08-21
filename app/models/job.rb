class Job < ApplicationRecord
  # Declare relationship with other classes
  belongs_to :employer
  # Validates the job's description
  validates :employer_id, presence: true
  validates :name, presence: true
  validates :info, presence: true
end
