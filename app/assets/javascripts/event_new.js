$(function () {

  // 新規学校登録の表示・非表示
  $('.new_school').hide();
  $('#new_school_check_box').change(function () {
    var prop = $(this).prop('checked');
    if (prop) {
      $('.new_school').show();
      $('#school-select').attr('disabled','disabled'); // 選択不可にする
    } else {
      $('.new_school').hide();
      $('#school-select').removeAttr('disabled');
    }
  });

  // web公開日の表示・グレーアウト
  $('.public-wrap').addClass('disabled');
  $('.public-wrap__date').attr('disabled','disabled');
  $('#public-period__checkbox').attr('disabled','disabled');
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

  // カレンダー形式の日付入力
  $('.public-wrap__date').flatpickr({
    'locale': 'ja',
    dateFormat: 'Y/m/d',
    minDate: 'today',
    defaultDate: 'today'
  });

  // チェックすると1ヶ月後の日付を表示
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
