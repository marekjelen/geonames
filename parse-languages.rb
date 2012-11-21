#!/usr/bin/env ruby

require 'yajl'

data = File.open('iso-languagecodes.txt')

def hasher(array)
	{
		:iso_639_3    => array[0],
		:iso_639_2    => array[1],
		:iso_639_1    => array[2],
		:name         => array[3],
	}
end

data.readline

until data.eof?
	line = data.readline
	tmp = hasher(line.strip.split("\t"))
	unless tmp.size == 4
		puts tmp.inspect
	else
		puts Yajl::Encoder.encode(tmp)
	end
end