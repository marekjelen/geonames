#!/usr/bin/env ruby

require 'yajl'

data = File.open('countryInfo.txt')

def hasher(array)
	{
		:iso             => array[0],
		:iso3            => array[1],
		:ison            => array[2],
		:fips 					 => array[3],
		:name            => array[4],
		:capital         => array[5],
		:area            => array[6],
		:population      => array[7],
		:continent       => array[8],
		:tld             => array[9],
		:currency_code   => array[10],
		:currency_name   => array[11],
		:extension       => array[12],
		:postal_format   => array[13],
		:postal_regexp   => array[14],
		:languages       => array[15],
		:geonameid       => array[16],
		:neighbours      => array[17],
		:fips_code       => array[18]
	}
end

until data.eof?
	line = data.readline
	next if line =~ /^#/
	tmp = hasher(line.strip.split("\t"))
	unless tmp.size == 19
		puts tmp.inspect
	else
		puts Yajl::Encoder.encode(tmp)
	end
end