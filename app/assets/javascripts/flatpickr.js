$(document).on('turbolinks:load', function(){
  // カレンダー形式の日付入力設定
  $('.public-wrap__date').flatpickr({
    'locale': 'ja',
    dateFormat: 'Y/m/d',
    minDate: 'today',
    defaultDate: 'today'
  });

  // web公開日の表示・グレーアウト処理
  // 公開日に値があるかどうか判定
  var start_date = $('#public_start_date_hidden').val();
  var end_date = $('#public_end_date_hidden').val();
  if (!(start_date == "")){
    $('#web_public_presence').prop('checked','checked');
    $('#web_public_none').prop('checked', false);
    $('.public-wrap').removeClass('disabled');
    $('.public-wrap__date').removeAttr('disabled');
    $('#public-period__checkbox').removeAttr('disabled');
    $('#public-wrap__start-date').val(start_date);
    $('#public-wrap__end-date').val(end_date);
  } else {
    // 値がなければ入力フォームをグレーアウト
    $('#web_public_none').prop('checked','checked');
    $('.public-wrap').addClass('disabled');
    $('.public-wrap__date').attr('disabled','disabled');
    $('#public-period__checkbox').attr('disabled','disabled');
  }
  // チェックをした後の動き
  $('input[name="event[web_public]"]:radio').change(function () {
    var radioval = $(this).val();
    if (radioval == 0) {                              // web公開有がチェックされた時
      $('.public-wrap').removeClass('disabled');
      $('.public-wrap__date').removeAttr('disabled');
      $('#public-period__checkbox').removeAttr('disabled');
    } else {
      $('.public-wrap').addClass('disabled');
      $('.public-wrap__date').attr('disabled','disabled');
      $('#public-period__checkbox').attr('disabled','disabled');
    }
  });

  // チェックすると1ヶ月後の日付を表示する処理
  $('#public-period__checkbox').change(function () {
    // 1ヶ月後の日付を算出する関数
    Date.prototype.addMonth = function( m ) {
      var d = new Date( this );
      var dates = d.getDate();
      var years = Math.floor( m / 12 );
      var months = m - ( years * 12 );
      if( years ) d.setFullYear( d.getFullYear() + years );
      if( months ) d.setMonth( d.getMonth() + months );
      if( dates == 1 ) {
          d.setDate( 0 );
      } else {
          d.setDate( d.getDate() - 1 );
      }
      return d;
    }

    startDate = $('#public-wrap__start-date').val(); // 公開開始日を取得
    var d = new Date( startDate );
    var endDateBefore = d.addMonth( 1 ); // 関数で計算

    // 日付のフォーマットを変換する関数
    function sampleDate(date, format) {
      format = format.replace(/YYYY/, date.getFullYear());
      format = format.replace(/MM/, ('0' + (date.getMonth() + 1)).slice(-2));
      format = format.replace(/DD/, ('0' + date.getDate()).slice(-2));
      return format;
    }
    var endDate = sampleDate(new Date(endDateBefore), 'YYYY/MM/DD') // 計算結果の日付をフォーマット変換

    var prop = $(this).prop('checked');
    if (prop) {
      $('#public-wrap__end-date').val(endDate);
    }
  });
});