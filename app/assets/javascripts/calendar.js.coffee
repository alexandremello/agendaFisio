$(document).ready ->
  $('#calendar').fullCalendar
    defaultView: 'agendaWeek',
    header:
      left: 'prev,next today',
      center: 'title',
      right: 'today prev,next'

    editable: true,
    disableDragging: false,
    disableResizing: true,

    height: 500,
    slotMinutes: 15,
    allDayDefault: false,
    eventSources: [{
      url: '/appointments',
    }],
    timeFormat: 'h:mm t{ - h:mm t} ',
    dragOpacity: "0.5"

    eventDrop: (event, dayDelta, minuteDelta, allDay, revertFunc) ->
      updateEvent(event);

    eventResize: (event, dayDelta, minuteDelta, revertFunc) ->
      updateEvent(event);

updateEvent = (the_event) ->
  $.update "/appointments/" + the_event.id,
    event:
      name: the_event.title,
      starts_at: "" + the_event.start,
      ends_at: "" + the_event.end,
      ket: the_event.description