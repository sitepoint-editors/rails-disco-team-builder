module Domain
  class PlayerProcessor
    include ActiveDomain::CommandProcessor
    process AddPlayerCommand do |command|
      if command.valid?
        id = ActiveDomain::UniqueCommandIdRepository.new_for command.class.name
        event AddedPlayerEvent.new command.to_hash.merge(id: id)
      end
    end
  end
end
