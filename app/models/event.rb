class Event < ActiveRecord::Base
  attr_accessible :name, :body

  belongs_to :user

  has_attached_file :photo, :styles => { :small => "150x150>" }

  validates :body, :presence => true
  validates :user_id, :presence => true

 default_scope :order => 'events.created_at DESC'         #new first, oldest next

end
