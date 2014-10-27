module Domain
  class PlayerProcessor
    include ActiveDomain::CommandProcessor
    process DeletePlayerCommand do |command|
      if command.valid?
        event DeletedPlayerEvent.new command.to_hash
      end
    end

    process UpdatePlayerCommand do |command|
      if command.valid?
        event UpdatedPlayerEvent.new command.to_hash
      end
    end

    process CreatePlayerCommand do |command|
      if command.valid?
        id = ActiveDomain::UniqueCommandIdRepository.new_for command.class.name
        event CreatedPlayerEvent.new command.to_hash.merge(id: id)
      end
    end
  end
end
