class UpdatePlayerCommand
  include ActiveModel::Model
  include ActiveEvent::Command
  form_name 'Player'
  attributes :id, :name, :position, :number, :team_id

  def persisted?; true end
end
