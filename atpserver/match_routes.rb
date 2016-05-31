MATCH_PLAYER_OPTIONS = ['winner', 'loser']

get /\A\/matches\/(?<id>[\d]+)\/(?<action>.*)\z/ do |id, action|
  match = Match.find_by(id:id)
  return json match.send(action) if match and MATCH_PLAYER_OPTIONS.include? action
  status 404
  json "Not Found"
end

get '/matches/suggest' do
  return json Match.suggest(params)
end

MATCH_OPTIONS = ['slams', 'finals']
MATCH_YEAR_OPTION = /in_\d{4}/

get /\A\/matches\/(?<filterstring>.*)\z/ do |filterstring|
  filters = filterstring.split('/')
  matches = get_matches filters
  search_params = params.except('splat', 'captures', 'filterstring')
  return json matches.suggest(search_params)
  status 404
  json "Not Found"
end

def get_matches filters
  filters.inject(Match) do |acc, fil|
    if MATCH_OPTIONS.include? fil or MATCH_YEAR_OPTION.match(fil).present?
      acc.send(fil)
    else
      acc
    end
  end
end