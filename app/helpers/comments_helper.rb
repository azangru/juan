module CommentsHelper

  def put_tags_in_comment(text)
    # replace \n with line breaks
    text.gsub!(/\n/, '<br/>')

    #replace italics pseudotags
    text.gsub!("|||italics|||", "<em>")
    text.gsub!("|||/italics|||", "</em>")

    #replace comment-quote pseudotags
    text.gsub!("|||comment-quote|||", "<div class='comment-quote'>")
    text.gsub!("|||/comment-quote|||", "</div>")

    #replace comment-quote-attribution pseudotags
    text.gsub!("|||comment-quote-attr|||", "<div class='comment-quote-attr'>")
    text.gsub!("|||/comment-quote-attr|||", "</div>")

    #replace comment-footnote pseudotags
    text.gsub!("|||comment-footnote|||", "<div class='comment-footnote'>")
    text.gsub!("|||/comment-footnote|||", "</div>")

    #return text with html tags and tell Rails to use these tags
    text.html_safe
  end

end