def check_for_article_number(line)
  if line.start_with? "Article" and line[-1, 1]=="."
    words = line[0, line.length-1].split(/\s+/)
    return words[1] if words.length==2
  end
  return -1
end

f = File.open(ARGV[0], "r")
censor=["i", "we", "you", "they", "a", "and", "the", "that", "of", "for", "with"]
articles = Hash.new
lines, characters, prop_char, word_count, prop_words =0, 0, 0, 0, 0
curr_article, total_sections, sec_count = 0, 0, 0
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
  (line.start_with? "Section")?(total_sections+=1; articles[curr_article]+= 1):()
  num = check_for_article_number(line)
  next if num == -1
  if num != curr_article
    curr_article = num
    articles[num] = 0
  end
end
puts "all:\t#{lines}\t#{word_count}\t#{characters}\t#{name}"
puts "proper:\t#{lines}\t#{prop_words}\t#{prop_char}\t#{name}"
puts "Total Articles: #{articles.length}"
puts "Total Sections: #{total_sections}"
puts "Total Sections per Article:"
articles.each do |x,y| puts "\tArticle #{x}: #{y}" end
f.close

