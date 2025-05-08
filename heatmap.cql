from(bucket: "light_data")
  |> range(start: 0)
  |> filter(fn: (r) => r["_measurement"] == "mqtt_consumer")
  |> filter(fn: (r) => r["_field"] == "light")
  |> filter(fn: (r) => r["host"] == "SwaMy")
  |> filter(fn: (r) => r["topic"] == "sensors/light")
  |> histogram(bins: [0.0, 50.0, 100.0, 150.0, 200.0, 250.0, 300.0,400.0,500.0, 600.0,1000.0])  // Manually specifying bins as floating-point values
  |> yield(name: "histogram")