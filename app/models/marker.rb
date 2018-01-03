class Marker < ApplicationRecord

  attribute :avatar, :string, default: "http://homepages.neiu.edu/~whuang2/cs300/images/white.png"


  validates :lat, presence: true, numericality: { only_float: true }, inclusion: { in: -180..180 }
  validates :lng, presence: true, numericality: { only_float: true }, inclusion: { in: -180..180 }
  validates :name, length: { maximum: 100 }
  validates :avatar, presence:true, length: { maximum: 400 }
  validates :website, presence: true, length: { maximum: 300 }
  validates :year, inclusion: { in: 1900..Date.today.year }, format: { with: /(19|20)\d{2}/i,  message: "should be a four-digit year"}
  validates :address, length: { maximum: 100}
  validates :about, length:{ maximum: 300}


end
