jQuery ->

  $('#size-plus').click ->
    size = $('.paragraph p').css('font-size')
    line = $('.paragraph p').css('line-height')
    size = parseInt(size)
    line = parseInt(line)
    $('.paragraph p').css('font-size', size+1+'px')
    $('.paragraph p').css('line-height', line+2+'px')

  $('#size-minus').click ->
    size = $('.paragraph p').css('font-size')
    line = $('.paragraph p').css('line-height')
    size = parseInt(size)
    line = parseInt(line)
    $('.paragraph p').css('font-size', size-1+'px')
    $('.paragraph p').css('line-height', line-2+'px')

  $('#width-minus').click ->
    width = $('.paragraph').css('width')
    width = parseInt(width)
    $('.paragraph').css('width', width-10+'px')
