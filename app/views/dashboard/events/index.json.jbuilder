json.array!(@events) do |event|
  json.extract! event, :id, :title
  json.start event.start
  json.end event.end
  json.color event.color
  json.allDay event.all_day_event? ? true : false
  json.update_url dashboard_trip_event_path(event.trip,event, method: :patch)
  json.edit_url edit_dashboard_trip_event_path(event.trip, event)
end
