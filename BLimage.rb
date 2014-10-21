require 'RMagick'
require "FileUtils"
include Magick


unless File.directory?('c')
  FileUtils.mkdir_p('c')
end
unless File.directory?('bl')
  FileUtils.mkdir_p('bl')
end

while true

file = Dir.glob('*.jpg').first
if file == nil
	file = Dir.glob('*.png').first
	if file == nil
		file = Dir.glob('*.jpeg').first
		if file == nil
			puts "finished"
			exit
		end
	end
end

img = Magick::Image.read(file).first
img = img.quantize(100)
hist = img.color_histogram
pixels = hist.keys.sort_by {|pixel| hist[pixel] }

narray = pixels.first(5)
string1 = pixels[0]
string2 = pixels[1]
string3 = pixels[2]
string4 = pixels[3]
string5 = pixels[4]

string1 = string1.to_s.split("=")
s1p1 = string1[1].to_i
s1p2 = string1[2].to_i
s1p3 = string1[3].to_i

string2 = string2.to_s.split("=")
s2p1 = string2[1].to_i
s2p2 = string2[2].to_i
s2p3 = string2[3].to_i

string3 = string3.to_s.split("=")
s3p1 = string3[1].to_i
s3p2 = string3[2].to_i
s3p3 = string3[3].to_i

string4 = string4.to_s.split("=")
s4p1 = string4[1].to_i
s4p2 = string4[2].to_i
s4p3 = string4[3].to_i

string5 = string5.to_s.split("=")
s5p1 = string5[1].to_i
s5p2 = string5[2].to_i
s5p3 = string5[3].to_i


if s1p1 == s1p2 and s1p2 == s1p3
	s1logic = true
else 
	s1logic = false
end

if s2p1 == s2p2 and s2p2 == s2p3
	s2logic = true
else 
	s2logic = false
end

if s3p1 == s3p2 and s3p2 == s3p3
	s3logic = true
else 
	s3logic = false
end

if s4p1 == s4p2 and s4p2 == s4p3
	s4logic = true
else 
	s4logic = false
end

if s5p1 == s5p2 and s5p2 == s5p3
	s5logic = true
else 
	s5logic = false
end

if s1logic and s2logic and s3logic and s4logic and s5logic
	puts '%s true' % [file]
	FileUtils.mv( file, "bl/#{file}" )
else 
	puts '%s false' % [file]
	FileUtils.mv( file, "c/#{file}" )
end

end
