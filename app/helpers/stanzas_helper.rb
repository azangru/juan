module StanzasHelper

def put_tags_in_stanza(text)
  # replace \n with line breaks
  text.gsub!(/\n/, '<br/>')

  #replace italics pseudotags
  text.gsub!("|||italics|||", "<em>")
  text.gsub!("|||/italics|||", "</em>")

  #replace small caps pseudotags
  text.gsub!("|||smallcaps|||", "<span class='smallcaps'>")
  text.gsub!("|||/smallcaps|||", "</span>")

  #get the information about the comment pseudotags
  labels = text.scan(/(\|\|\|.*?\|\|\|)/) # gets an array of arrays of pseudotags such as |||asimov-4|||
  numbers = text.scan(/\|\|\|asimov-(.*?)\|\|\|/) # gets an array of arrays of numbers of comments (such as: 4)
  annotators = text.scan(/\|\|\|([a-zA-Z]*)-/) # gets an array of arrays of annotators (such as 'asimov')

  #step through the list of comment pseudotags and replace them with proper links
  labels.each do |l| # an l is an array inside the array of arrays of pseudotags
    text.gsub!("#{l.first}", "<a href='#' class='comment-link' data-comment-number='#{numbers[labels.index(l)].first}' data-annotator='#{annotators[labels.index(l)].first}'>*</a>")
  end

  #return text with html tags and tell Rails to use these tags
  text.html_safe
end

end
