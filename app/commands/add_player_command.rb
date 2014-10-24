class AddPlayerCommand
  include ActiveModel::Model
  include ActiveEvent::Command
  form_name 'Player'
  attributes :name, :position, :number, :team_id
end
