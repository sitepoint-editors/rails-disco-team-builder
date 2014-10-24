class UpdateTeamCommand
  include ActiveModel::Model
  include ActiveEvent::Command
  form_name 'Team'
  attributes :id, :name, :age, :gender

  def persisted?; true end
end
