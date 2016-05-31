get /\A\/players\/(?<player_id>[\d]+)\z/ do |player_id|
  player = Player.find_by(player_id:player_id)
  return json player if player
  status 404
  json "Invalid id"
end

PLAYER_MATCH_OPTIONS = ['wins', 'losses', 'matches', 'slams', 'slams_finals']

get /\A\/players\/(?<player_id>[\d]+)\/(?<action>.*)\z/ do |player_id, action|
  player = Player.find_by(player_id:player_id)
  return json player.send(action).select_compact if player and PLAYER_MATCH_OPTIONS.include? action
  status 404
  json "Not Found"
end

get '/players/suggest' do
  return json Player.suggest(params)
end

get /\A\/matches\/(?<id>[\d]+)\z/ do |id|
  match = Match.find_by(id:id)
  return json match if match
  status 404
  json "Invalid id"
end