$(document).on('turbolinks:load', function(){

  // 新規学校登録の表示・非表示処理
  $('.new_school').hide();
  $('#new_school_check_box').change(function () {
    var prop = $(this).prop('checked');
    if (prop) {
      $('.new_school').show();
      $('#school_select').attr('disabled','disabled'); // 選択不可にする
      $('#school_select').addClass('disabled');
    } else {
      $('.new_school').hide();
      $('#school_select').removeAttr('disabled');
      $('#school_select').removeClass('disabled');
    }
  });

  // 選択された画像を取得し表示する処理
  $fileField = $('#drop_area')
  $($fileField).on('change', $fileField, function(e) {
    file = e.target.files[0]
    reader = new FileReader(),
    $preview = $("#img_field");

    reader.onload = (function(file) {
      return function(e) {
        $preview.empty();
        $preview.append($('<img>').attr({
          src: e.target.result,
          width: "100%",
          class: "preview",
          title: file.name
        }));
      };
    })(file);
    reader.readAsDataURL(file);
  });
});

// Dropzone用の記述
// $(document).ready(function () {
//   Dropzone.autoDiscover = false;
//   $("#item-dropzone").dropzone({
//       // url: "hn_SimpeFileUploader.ashx",
//       url: "/images",
//       addRemoveLinks: true,
//       success: function (file, response) {
//           var imgName = response;
//           file.previewElement.classList.add("dz-success");
//           console.log("Successfully uploaded :" + imgName);
//       },
//       error: function (file, response) {
//           // file.previewElement.classList.add("dz-error");
//       }
//   });
// });
