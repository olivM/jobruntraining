class Event
  include Mongoid::Document
  field :title, type: String
  field :date, type: Date
end
