class UserFatigue
  include Mongoid::Document

  field :date, type: Date
  field :fatigue, type: String

  def pretty
  	"#{self.date} #{self.fatigue}"
  end

end
