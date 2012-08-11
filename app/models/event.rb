class Event
	include Mongoid::Document
	field :title, type: String
	field :date, type: Date, default: ->{Date.today}
	field :send_reminder, type: Boolean

	validates_presence_of :title
	validates_presence_of :date

	has_and_belongs_to_many :users

end
