//インストールしたファイルたちを呼び出します。
import { Calendar} from '@fullcalendar/core';
import interactionPlugin from '@fullcalendar/interaction';
import monthGridPlugin from '@fullcalendar/daygrid'
import timeGridPlugin from '@fullcalendar/timegrid'

//<div id='calendar'></div>のidからオブジェクトを定義してカレンダーを作っていきます。
document.addEventListener('turbolinks:load', function() {
    var calendarEl = document.getElementById('calendar');

    //カレンダーの中身を設定(月表示、クリックアクション起こす)
    var calendar = new Calendar(calendarEl, {
        plugins: [ monthGridPlugin, interactionPlugin, timeGridPlugin ],


        //細かな表示設定
        locale: 'ja',
        timeZone: 'Asia/Tokyo',
        firstDay: 1,
        headerToolbar: {
          start: '',
          center: 'title',
          end: 'today prev,next'
        },
        expandRows: true,
        stickyHeaderDates: true,
        buttonText: {
           today: '今日'
        },
        allDayText: '終日',
        height: "auto",

        dateClick: function(info){
            //日付をクリックしたときのイベント
        },
        eventClick: function(info){
            //表示されたイベントをクリックしたときのイベント
        },
        eventClassNames: function(arg){
            //表示されたイベントにclassをcss用に追加する
        }
        events: '/tasks.json',
        // 書き方のルールとしては['/コントローラー名.json']
    });

    //カレンダー表示
    calendar.render();

    //成功、失敗modalを閉じたときに予定を再更新してくれます
    //これがないと追加しても自動更新されません
    $(".error").click(function(){
        calendar.refetchEvents();
    });

});