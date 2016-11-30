json.array!(@event) do |event|
  json.extract! event, :id, :title
  json.start event.start
  json.end event.end
  json.color event.color
end