require 'RMagick'
require "FileUtils"
include Magick

i = 0

begin
expression = File.join('*.jpg')
file = Dir.glob(expression).first
filelist = ImageList.new(file)
imagetf = filelist.histogram?
if imagetf == true
	puts '%s true' % [file]
	FileUtils.mv file, '\bl'#, :force => true :noop => true,
else
	puts '%s false' % [file]
	FileUtils.mv file, '\c'#, #:force => true :noop => true,
end
end until i > 1