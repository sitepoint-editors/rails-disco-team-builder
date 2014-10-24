class TeamsController < ApplicationController
  include EventSource

  def index
    @teams = Team.all
  end

  def show
    @team = Team.find(id_param)
  end

  def new
    @team = CreateTeamCommand.new
  end

  def edit
    @team = UpdateTeamCommand.new Team.find(id_param).attributes
  end

  def create
    @team = CreateTeamCommand.new team_params
    if store_event_id Domain.run_command(@team)
      redirect_to @team, notice: 'Team was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    @team = UpdateTeamCommand.new team_params.merge(id: id_param)
    if store_event_id Domain.run_command(@team)
      redirect_to @team, notice: 'Team was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    delete_team = DeleteTeamCommand.new(id: id_param)
    if store_event_id Domain.run_command(delete_team)
      redirect_to teams_url, notice: 'Team was successfully destroyed.'
    else
      redirect_to team_url(id: id_param), alert: 'Team could not be deleted.'
    end
  end

  private

  def team_params
    params.require(:team).permit(:name, :age, :gender)
  end

  def id_param
    params.require(:id).to_i
  end
end
