class User
	include Mongoid::Document
	# Include default devise modules. Others available are:
	# :token_authenticatable, :confirmable,
	# :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
				 :recoverable, :rememberable, :trackable, :validatable

	field :first_name
	field :last_name

	field :imported, :type => Boolean, :default => false

	## Database authenticatable
	field :email,              :type => String, :default => ""
	field :encrypted_password, :type => String, :default => ""

	validates_presence_of :email
	validates_presence_of :encrypted_password

	## Recoverable
	field :reset_password_token,   :type => String
	field :reset_password_sent_at, :type => Time

	## Rememberable
	field :remember_created_at, :type => Time

	## Trackable
	field :sign_in_count,      :type => Integer, :default => 0
	field :current_sign_in_at, :type => Time
	field :last_sign_in_at,    :type => Time
	field :current_sign_in_ip, :type => String
	field :last_sign_in_ip,    :type => String

	## Confirmable
	# field :confirmation_token,   :type => String
	# field :confirmed_at,         :type => Time
	# field :confirmation_sent_at, :type => Time
	# field :unconfirmed_email,    :type => String # Only if using reconfirmable

	## Lockable
	# field :failed_attempts, :type => Integer, :default => 0 # Only if lock strategy is :failed_attempts
	# field :unlock_token,    :type => String # Only if unlock strategy is :email or :both
	# field :locked_at,       :type => Time

	## Token authenticatable
	# field :authentication_token, :type => String

	embeds_many :user_weights
	accepts_nested_attributes_for :user_weights

	embeds_many :user_fatigues
	accepts_nested_attributes_for :user_fatigues

	has_and_belongs_to_many :events

	def current_weight
		self.user_weights.last.weight unless self.user_weights.last.nil?
	end
	def current_fatigue
		self.user_fatigues.last.weight unless self.user_fatigues.last.nil?
	end

	def pretty
		"#{self.first_name} #{self.last_name}"
	end

end
