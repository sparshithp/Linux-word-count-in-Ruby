f = File.open(ARGV[0], "r")
lines=0
characters=0
words=0
name = File.basename(f.path)
f.each_line do |line|
  lines += 1
  characters += line.length
  words += line.split(/\s+/).length
end
  puts "#{lines}\t#{words}\t#{characters}\t#{name}"
f.close
