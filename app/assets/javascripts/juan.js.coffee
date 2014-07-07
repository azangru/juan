$ ->

######## MULTI-PAGE FORM #################

  $('.hidden').hide().removeClass('hidden') # a hack around Bootstrap's default behaviour of class 'hidden' (I use this class in the form). Could have used {style: "display: none"} instead of class 'hidden'
  $('.selection input:submit').hide() # hide the form submit button, because I trigger the submit event by JS

  changeView = (current, next) ->
    height = $('.selection').height()
    $('.selection').height(height)  # to prevent the well from changing the size too much
    $("##{current}").hide ->
      $("##{next}").fadeIn()
      $('.selection').removeAttr('style')

  # Various possible combinations in the form #

  #first view
  $("label[for='view_no_annotations']").click ->
    changeView 'selection-first', 'selection-without-annotations'
  $("label[for='view_asimov_annotations']").click ->
    changeView 'selection-first', 'selection-cantos'
  $("label[for='view_parallel_texts']").click ->
    changeView 'selection-first', 'selection-parallel-texts'

  # view for unannotated texts
  $("label[for='text_english_original'], label[for='text_russian_gnedich'], label[for='text_russian_shengheli']").click ->
    changeView 'selection-without-annotations', 'selection-cantos'

  # view for parallel texts
  $('*[data-direction="from_parallel_to_cantos"]').click (e) ->
    e.preventDefault()
    changeView 'selection-parallel-texts', 'selection-cantos'

  # cantos view
  $("label[for='canto_dedication'], label[for='canto_canto1']").click ->
    $label = $(this)
    $label.prev().prop('checked',true) # because otherwise the form will be sent without the value of this radio button
    $('.selection form').submit()    
  # END OF FORM #

  ######## ANNOTATIONS #################
  $(".comment-link").click (e) ->
    e.preventDefault()
    annotator = $(this).data('annotator')
    comment_number = $(this).data('comment-number')
    data_to_send = {annotator: annotator, comment_number: comment_number}
    $.getJSON(
      "/comments.json",
      data_to_send,
      (data) ->
        showComment(data)
      )

  showComment = (data) ->
    text = replaceTags(data.text)
    $(".modal-title").html("Note #{data.number}")
    $(".modal-body").html(text)
    $(".modal").modal('show')

  replaceTags = (input) ->
    # replace \n with <br/>
    input = input.replace(/\n/g, '<br/>')
    # replace italics pseudotags
    input = input.replace(/\|\|\|italics\|\|\|(.*?)\|\|\|\/italics\|\|\|/g, '<em>$1</em>')
    # replace comment-quote pseudotags (take care! this line will only work once \n line breaks are substituted by <br />)
    input = input.replace(/\|\|\|comment-quote\|\|\|(.*?)\|\|\|\/comment-quote\|\|\|/g, "<div class='comment-quote'>$1</div>")
    # replace comment quote attribute pseudotags
    input = input.replace(/\|\|\|comment-quote-attr\|\|\|(.*?)\|\|\|\/comment-quote-attr\|\|\|/g, "<div class='comment-quote-attr'>$1</div>")
    # replace footnote pseudotags
    input = input.replace(/\|\|\|comment-footnote\|\|\|(.*?)\|\|\|\/comment-footnote\|\|\|/g, "<div class='comment-footnote'>$1</div>")

  # END OF ANNOTATIONS #

  ######## CANTO/STANZA FORM IN TOP ########

  $("#cantos-dropdown").change ->
    canto = $(this).find("option:selected").text()
    data_to_send = {canto_name: canto}
    $.getJSON(
      "/cantos.json",
      data_to_send,
      (data) ->
        buildStanzaSelector(data)
      )

  buildStanzaSelector = (num) ->
    html = ""
    for i in [1..num] by 1
      html += "<option value='#{i}'>Stanza#{i}</option>\n"
    $('#stanzas-dropdown').html(html)

  $("#stanzas-dropdown").change ->
    stanza = $(this).find("option:selected").val()
    canto = $("#cantos-dropdown").find("option:selected").val()
    # update the form attributes so that it submits to the proper url
    form_attributes = {action: "/cantos/#{canto}/stanzas/#{stanza}", method: 'get'}
    $('#stanza-selection-panel form').attr(form_attributes)

  ######### END OF CANTO/STANZA FORM #######

