$(document).on('turbolinks:load', function(){
  $(".event-form-content").validate({
    rules : {
      "event[name]": {
        required: true
      },
      "event[school_id]": {
        required: true
      },
      "school[name]": {
        required: true
      }
    },
    messages: {
      "event[name]":{
          required: "イベント名を入力してください。"
      },
      "event[school_id]":{
          required: "学校を選択するか、新しい学校を登録してください。"
      },
      "school[name]":{
          required: "学校名を入力してください。"
      }
    }
    // エラーメッセージ出す位置指定する
    // errorPlacement: function(error, element) {
    //   if(element.attr("name")=="event[name]"){
    //     error.insertAfter("#event_name_error");
    //   }else if(element.attr("name")=="school[name]"){
    //     error.insertAfter("#school_name_error");
    //   }else{
    //     error.insertAfter(element);
    //   }
    // }
  });
});