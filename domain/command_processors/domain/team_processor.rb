module Domain
  class TeamProcessor
    include ActiveDomain::CommandProcessor
    process DeleteTeamCommand do |command|
      if command.valid?
        event DeletedTeamEvent.new command.to_hash
      end
    end

    process UpdateTeamCommand do |command|
      if command.valid?
        event UpdatedTeamEvent.new command.to_hash
      end
    end

    process CreateTeamCommand do |command|
      if command.valid?
        id = ActiveDomain::UniqueCommandIdRepository.new_for command.class.name
        event CreatedTeamEvent.new command.to_hash.merge(id: id)
      end
    end

  end
end
