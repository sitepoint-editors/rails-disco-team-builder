class PlayersController < ApplicationController
  include EventSource
  before_action :team

  def index
    @players = Player.all
  end

  def show
    @player = Player.find(id_param)
  end

  def new
    @player = CreatePlayerCommand.new(team_id: team_id_param) 
    @player.team_id = params[:team_id]
  end

  def edit
    @player = UpdatePlayerCommand.new Player.find(id_param).attributes
  end

  def create
    @player = CreatePlayerCommand.new player_params.merge(team_id: team_id_param)
    if store_event_id Domain.run_command(@player)
      redirect_to team_players_path(@team), notice: 'Player was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    @player = UpdatePlayerCommand.new player_params.merge(id: id_param)
    if store_event_id Domain.run_command(@player)
      redirect_to team_players_path(@team), notice: 'Player was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    delete_player = DeletePlayerCommand.new(id: id_param)
    if store_event_id Domain.run_command(delete_player)
      redirect_to team_players_url(@team), notice: 'Player was successfully destroyed.'
    else
      redirect_to team_playerurl(@team), alert: 'Player could not be deleted.'
    end
  end

  private

  def player_params
    params.require(:player).permit(:name, :position, :number, :team_id)
  end

  def id_param
    params.require(:id).to_i
  end

  def team_id_param
    params.require(:team_id).to_i
  end

  def team
    @team = Team.find(team_id_param)
  end
end
