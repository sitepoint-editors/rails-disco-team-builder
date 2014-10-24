class TeamProjection
  include ActiveProjection::ProjectionType

  def deleted_team_event(event)
    Team.find(event.id).destroy!
  end

  def updated_team_event(event)
    Team.find(event.id).update! event.values
  end

  def created_team_event(event)
    Team.create! event.to_hash
  end
  
end
