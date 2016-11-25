class Page < ApplicationRecord
	belongs_to :subject #, { :optional => true }#, {:foreign_key => 'foo_id'}
	has_many :sections
	has_and_belongs_to_many :admin_users #, :join_table => 'pages_admin_users'

	scope :sorted, lambda { order("position ASC") }
end
