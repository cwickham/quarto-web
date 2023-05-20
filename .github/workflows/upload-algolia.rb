require 'json'
require 'algolia'
require 'open-uri'

apiKey = ENV["ALGOLIA_API_KEY"]
appId = ENV["ALGOLIA_APP_ID"]
indexName = ENV["ALGOLIA_INDEX"]
indexFile = ENV["QUARTO_INDEX_PATH"]


client  = Algolia::Search::Client.create(appId, apiKey)
index   = client.init_index(indexName)
file    = File.read('search.json')
records = JSON.parse(file)

# The API client automatically batches your records
index.replace_all_objects(records, {})
