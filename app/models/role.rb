class Role < ActiveRecord::Base
  has_many :auditions

  def actors
    auditions.pluck(:actor)
  end

  def locations
    auditions.pluck(:location)
  end

  def lead
    auditions.where(hired: true).first || "no actor has been hired for this role"
  end

  def understudy
    auditions.where(hired: true).second || "no actor has been hired for understudy for this role"
  end
end
