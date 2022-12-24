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
        events: '/events.json',// '/コントローラー名.json',
        navLinks: true,
	    selectable: true,
	    selectHelper: true,
        // 日付クリック
			dateClick : function ( date , jsEvent , view ) {
				$('#inputScheduleForm').modal('show');
				},

			// event クリックで編集、削除
			eventClick : function(event, jsEvent , view) {
	    		jsEvent.preventDefault();
				$(`#inputScheduleEditForm${event.id}`).modal('show');
	  		},

	  		eventMouseover : function(event, jsEvent , view) {
	    		jsEvent.preventDefault();
	  		}


    });

    //カレンダー表示
    calendar.render();

});