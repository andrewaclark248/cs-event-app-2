class Event < ApplicationRecord
	validates :name, presence: true
  	belongs_to :planner, :class_name => 'User', :foreign_key => 'user_id'

  	has_one_attached :image, :dependent => :destroy

end
