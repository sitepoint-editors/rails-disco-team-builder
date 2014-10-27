class PlayerProjection
  include ActiveProjection::ProjectionType

  def deleted_player_event(event)
    Player.find(event.id).destroy!
  end

  def updated_player_event(event)
    Player.find(event.id).update! event.values
  end

  def created_player_event(event)
    attrs = event.to_hash
    team_id = attrs.delete(:team_id)
    return if team_id.nil?
    team = Team.find(team_id)
    return if team.nil?
    team.players.create! event.to_hash
  end

end
