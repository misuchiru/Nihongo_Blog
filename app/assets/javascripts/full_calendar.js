var initialize_calendar;
initialize_calendar = function() {
    var t;
  

    $('.calendar').each(function(){
        var calendar = $(this);
        calendar.fullCalendar({
            editable: true,
            scrollTime: '05:00:00',
            height: 950,
            defaultView: 'agendaDate',
            header: {
                left: 'prev,today,next',
                center: 'title',
                right: 'agendaDay,agendaDate,month'
            },
            views: {
                agendaDate: {
                    type: 'agenda',
                    duration: {
                    }
                }
            }
        });
    })

};
$(document).on('turbolinks:load', initialize_calendar);
