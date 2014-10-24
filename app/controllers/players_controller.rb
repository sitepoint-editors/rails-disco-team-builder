class PlayersController < ApplicationController
  include EventSource
  before_action :find_team

  def index
    @players = @team.players
  end

  def new
    @player = AddPlayerCommand.new(team_id: @team.id)
  end

  def create
    @player = AddPlayerCommand.new player_params
    if store_event_id Domain.run_command(@player)
      redirect_to team_players_path(@team), notice: 'Player was successfully created.'
    else
      render action: 'new'
    end
  end

  private

  def player_params
    params.require(:player).permit(:name, :position, :number)
  end

  def id_param
    params.require(:id).to_i
  end

  def find_team
    @team = Team.find(params[:team_id])
  end
end
