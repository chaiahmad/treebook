class Status < ActiveRecord::Base
	attr_accessible :content, :user_id
	belongs_to :user
	default_scope order('created_at DESC')

	validates :content, presence: true,
						length: {minimum: 2}

	validates :user_id, presence: true
end
