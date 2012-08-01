class UserWeight
  include Mongoid::Document

  field :date, type: Date, default: Time.now
  field :weight, type: Float

  def pretty
  	"#{self.date} : #{self.weight}"
  end

end
