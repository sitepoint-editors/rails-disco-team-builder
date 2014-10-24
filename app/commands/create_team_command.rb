class CreateTeamCommand
  include ActiveModel::Model
  include ActiveEvent::Command
  form_name 'Team'
  attributes :name, :position, :number
end
