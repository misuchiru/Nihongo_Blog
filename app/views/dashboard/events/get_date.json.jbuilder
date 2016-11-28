json.defaultDate @trip.start_date.strftime("%F")
json.days (@trip.end_date - @trip.start_date).to_i / 86400 + 1
