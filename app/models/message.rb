class Message < ApplicationRecord
	default_scope -> {order(created_at: :desc)}
	validates :text, presence: true
end
