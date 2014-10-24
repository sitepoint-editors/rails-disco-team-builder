class AddedPlayerEvent
  include ActiveEvent::EventType
  attributes :id, :name, :position, :number, :team_id
  def values
    attributes_except :id
  end
end
