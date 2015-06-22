# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

JQuery -> 
  $('#new_image').fileupload 
    dataType: "script";

    add: (e, data) ->
      data.context = $(tmpl("template-upload", data.files[0]))
      $('#image').append(data.context)
      data.submit()
     progress: (e, data) ->
      if data.context
        progress = parseInt(data.loaded / data.total * 100, 10)
        data.context.find('.bar').css('width', progress + '%')
