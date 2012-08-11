class UserFatigue
  include Mongoid::Document

  field :date, type: Date
  field :fatigue, type: String

  def pretty
  	"#{self.fatigue} (#{self.fatigue})"
  end

  def fatigue_enum
  	['dead', 'tired', 'ok', 'fit', 'over the top']
  end

end
