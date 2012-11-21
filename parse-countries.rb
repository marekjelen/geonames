#!/usr/bin/env ruby

require 'yajl'

data = File.open('allCountries.txt')

def hasher(array)
	{
		:geonameid         => array[0],  # : integer id of record in geonames database
		:name              => array[1],  # : name of geographical point (utf8) varchar(200)
		:asciiname         => array[2],  # : name of geographical point in plain ascii characters, varchar(200)
		:alternatenames    => array[3],  # : alternatenames, comma separated varchar(5000)
		:latitude          => array[4],  # : latitude in decimal degrees (wgs84)
		:longitude         => array[5],  # : longitude in decimal degrees (wgs84)
		:feature_class     => array[6],  # : see http://www.geonames.org/export/codes.html, char(1)
		:feature_code      => array[7],  # : see http://www.geonames.org/export/codes.html, varchar(10)
		:country           => array[8],  # : ISO-3166 2-letter country code, 2 characters
		:cc2               => array[9],  # : alternate country codes, comma separated, ISO-3166 2-letter country code, 60 characters
		:admin1            => array[10], # : fipscode (subject to change to iso code), see exceptions below, see file admin1Codes.txt for display names of this code; varchar(20)
		:admin2            => array[11], # : code for the second administrative division, a county in the US, see file admin2Codes.txt; varchar(80) 
		:admin3            => array[12], # : code for third level administrative division, varchar(20)
		:admin4            => array[13], # : code for fourth level administrative division, varchar(20)
		:population        => array[14], # : bigint (8 byte int) 
		:elevation         => array[15], # : in meters, integer
		:dem               => array[16], # : digital elevation model, srtm3 or gtopo30, average elevation of 3''x3'' (ca 90mx90m) or 30''x30'' (ca 900mx900m) area in meters, integer. srtm processed by cgiar/ciat.
		:timezone          => array[17], # : the timezone id (see file timeZone.txt) varchar(40)
		:modification      => array[18], # : date of last modification in yyyy-MM-dd format
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