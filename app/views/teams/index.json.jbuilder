json.array!(@teams) do |team|
  json.extract! team, :id, :name, :age, :gender
  json.url team_url(team, format: :json)
end
