class TotalSerializer < ActiveModel::Serializer
  attributes :state, :type, :total

  def state
    object[0]
  end

  def type
    object[1]
  end

  def total
    object[-1]
  end

end
