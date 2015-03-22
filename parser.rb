f = File.open(ARGV[0], "r")
censor=["i", "we", "you", "they", "a", "and", "the", "that", "of", "for", "with"]
lines=0
characters=0
prop_char=0
word_count=0
prop_words=0
name = File.basename(f.path)
f.each_line do |line|
  lines += 1
  characters += line.length
  prop_char += line.length
  line.strip!
  next if line.nil?
  words = line.split(/\s+/)
  word_count += words.length
  prop_words += words.length
  words.each do |w|
      stripped_char = w.downcase.gsub(/\A[\d_\W]+|[\d_\W]+\Z/, '')
      if censor.include? stripped_char
        prop_char -= stripped_char.length
        prop_words -= 1
      end
  end
end
  puts "all:\t#{lines}\t#{word_count}\t#{characters}\t#{name}"
  puts "proper:\t#{lines}\t#{prop_words}\t#{prop_char}\t#{name}"
f.close
