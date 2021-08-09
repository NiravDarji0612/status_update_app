class Task < ApplicationRecord
  belongs_to :status
  validates :task_name, presence: true, length: { minimum:5 }
  validates :git_pr_link, presence: true
  validates :hour, presence: true
end
