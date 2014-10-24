class UpdatedTeamEvent
  include ActiveEvent::EventType
  attributes :id, :name, :age, :gender
  def values
    attributes_except :id
  end
end
