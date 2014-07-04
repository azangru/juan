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