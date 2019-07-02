$(function () {
  $('.new_school').hide();
  $('#new_school_check_box').change(function () {
    var prop = $('#new_school_check_box').prop('checked');
    if (prop) {
      $('.new_school').show();
    } else {
      $('.new_school').hide();
    }
  });
});
