# perform traceroute & put values in DB

require 'rubygems'
require 'sqlite3'

host= 'www.teksavvy.ca'

#
# open db, create if necessary 
#
db= SQLite3::Database.new('ping_data.db')
begin
	rows= db.execute("select * from results")
rescue => detail
	#database not initialized
	db.execute("CREATE TABLE results( time DATETIME, hop INTEGER);")
end

#
# perform traceroute
#
output= `traceroute www.teksavvy.ca`

#split output into individual lines
lines= output.split("\n")
lines.each {|line|

	#split line into fields
	fields= line.split(" ")

	#find field with ()

	#count # of 'ms' - that's # of readings
	#count # of * - that's # of missing readings
	#both of above should = 3
	
	#calc max and min time for each hop
	hop= fields[0]
	name= fields[1]   #will not be there if no reverse DNS
	ip_addr= fields[2]
	time= fields[3]

	#put fields into database
	time= Time.now()

	#save in database
}
