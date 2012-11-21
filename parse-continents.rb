#!/usr/bin/env ruby

File.open('continents.json', 'w') do |file|
	file.puts '{"code": "AF", "name": "Africa", "geonameId": "6255146"}'
	file.puts '{"code": "AS", "name": "Asia", "geonameId": "6255147"}'
	file.puts '{"code": "EU", "name": "Europe", "geonameId": "6255148"}'
	file.puts '{"code": "NA", "name": "North America", "geonameId": "6255149"}'
	file.puts '{"code": "SA", "name": "South America", "geonameId": "6255150"}'
	file.puts '{"code": "OC", "name": "Oceania", "geonameId": "6255151"}'
	file.puts '{"code": "AN", "name": "Antarctica", "geonameId": "6255152"}'
end