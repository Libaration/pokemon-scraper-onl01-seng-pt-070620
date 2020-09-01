require_relative "environment"

Scraper.new(@db).scrape

all_pokemon = @db.execute("SELECT * FROM pokemon;")
pp Pokemon.find_type('Electric', @db)

# test out your code here!
