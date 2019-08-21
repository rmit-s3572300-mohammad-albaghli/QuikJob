class Skill < ApplicationRecord
  has_and_belongs_to_many :jobseekers
  validates :name, presence: true, length: { maximum: 255 }, uniqueness: { case_sensitive: false}
end
