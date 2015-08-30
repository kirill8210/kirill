class Task < ActiveRecord::Base
  belongs_to :project
  validates_presence_of :name

  default_scope { order("priority ASC") }
  def completed?
  	!completed_at.blank?
  end
end
