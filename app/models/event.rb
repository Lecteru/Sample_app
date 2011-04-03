class Event < ActiveRecord::Base
  attr_accessible :name, :body

  belongs_to :user

  validates :body, :presence => true
  validates :user_id, :presence => true
end
