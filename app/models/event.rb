class Event
	include Mongoid::Document
	field :title, type: String
	field :date, type: Date, default: ->{Date.today}
	
	field :send_reminder, type: Boolean


	validates_presence_of :title
	validates_presence_of :date

	has_and_belongs_to_many :users

	after_update :send_reminders

	def send_reminders

		if self.send_reminder

			self.users.each do |user|
				Reminder.fatigue(user, self)
			end

			self.send_reminder = false
			self.save

		end

	end

end
