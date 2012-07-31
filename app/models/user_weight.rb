class UserWeight
  include Mongoid::Document

  field :date, type: Date
  field :weight, type: Float

end
