json.array!(@events) do |event|
  json.extract! event, :id, :title
  json.start event.start
  json.end event.end
  json.url edit_dashboard_trip_event_path(event.trip, event)
end
