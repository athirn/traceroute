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
	db.execute("CREATE TABLE results( time DATE PRIMARY KEY, hop1_ip TEXT, hop1_time REAL, hop2_ip TEXT, hop2_time REAL, hop3_ip TEXT, hop3_time REAL,hop4_ip TEXT, hop4_time REAL,hop5_ip TEXT, hop5_time REAL);")
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

	#if 1st row
	# INSERT INTO results (time,hop1_ip,hop1_time) VALUES ( ,)
	#if 2nd row
	# UPDATE results SET hop2_time= $(), hop2_ip= ${} WHERE time = ${}
	#if 3rd row
	# UPDATE results SET hop3_time= $(), hop3_ip= ${} WHERE time = ${}
	# UPDATE results SET hop4_time= $(), hop4_ip= ${} WHERE time = ${}
	# UPDATE results SET hop5_time= $(), hop5_ip= ${} WHERE time = ${}

	#save in database
}
