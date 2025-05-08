from(bucket: "light_data")
  |> range(start:0)
  |> filter(fn: (r) => r["_measurement"] == "mqtt_consumer")
  |> filter(fn: (r) => r["_field"] == "light")
  |> filter(fn: (r) => r["host"] == "SwaMy")
  |> filter(fn: (r) => r["topic"] == "sensors/light")
  |> aggregateWindow(every: 10s, fn: mean, createEmpty: false)
  |> yield(name: "mean")|