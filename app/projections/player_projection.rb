class PlayerProjection
  include ActiveProjection::ProjectionType

  def added_player_event(event)
    team = Team.find(event.to_hash[:team_id])
    team.players.create!(event.to_hash.except(:team_id))
  end
end
