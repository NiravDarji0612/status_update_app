class Status < ApplicationRecord
  has_many :tasks, dependent: :destroy
  accepts_nested_attributes_for :tasks
  validates :date, presence: true
  has_one_attached :status_picture
  
  def total_hours_count
    tasks.sum(:hour)
  end
end
