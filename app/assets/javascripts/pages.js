//All alerts will fade out after 4 seconds
$(document).on('turbolinks:load', function(){
  $('.alert').delay(1000).fadeOut(4000)
})