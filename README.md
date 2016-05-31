# atpserver
Data Server for ATP matches, implemented in Sinatra.

The data comes from [here](https://github.com/JeffSackmann/tennis_atp), which I've forked and ported to PostgreSQL [here](https://github.com/harman28/tennis_atp/tree/psql_support). The *atpruby* gem is up [here](https://github.com/harman28/atpruby), but it needs the data to run. That's asking a lot of the average tennis fan who just wants some stats, so this server is that MVP. Not da real one.

Documentation is upcoming.

`ruby atpserver.rb` to start the server.