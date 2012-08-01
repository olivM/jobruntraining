class Event
  include Mongoid::Document
  field :title, type: String
  field :date, type: Date

  has_and_belongs_to_many :user

end
