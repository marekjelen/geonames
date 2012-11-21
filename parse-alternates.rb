#!/usr/bin/env ruby

require 'yajl'

data = File.open('alternateNames.txt')

def hasher(array)
	{
		:alternateNameId   => array[0],  # : the id of this alternate name, int
		:geonameid         => array[1],  # : geonameId referring to id in table 'geoname', int
		:isolanguage       => array[2],  # : iso 639 language code 2- or 3-characters; 4-characters 'post' for postal codes and 'iata','icao' and faac for airport codes, fr_1793 for French Revolution names,  abbr for abbreviation, link for a website, varchar(7)
		:alternate_name    => array[3],  # : alternate name or name variant, varchar(200)
		:isPreferredName   => array[4],  # : '1', if this alternate name is an official/preferred name
		:isShortName       => array[5],  # : '1', if this is a short name like 'California' for 'State of California'
		:isColloquial      => array[6],  # : '1', if this alternate name is a colloquial or slang term
		:isHistoric        => array[7],  # : '1', if this alternate name is historic and was used in the past
	}
end

until data.eof?
	line = data.readline
	tmp = hasher(line.strip.split("\t"))
	unless tmp.size == 19
		puts tmp.inspect
	else
		puts Yajl::Encoder.encode(tmp)
	end
end