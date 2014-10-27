class CreateTeamCommand
  include ActiveModel::Model
  include ActiveEvent::Command
  form_name 'Team'
  attributes :name, :age, :gender

  validates :name, presence: true
end
