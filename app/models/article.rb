class Article < ActiveRecord::Base
	validates :title, presence: true, length: { minimum: 3, maximum: 50}
	validates :description, presence: true, length: {minimim: 10, maximum: 2000 }
	belongs_to :user
end
