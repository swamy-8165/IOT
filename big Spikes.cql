// Heatmap for light data over time
from(bucket: "light_data")
  |> range(start: 0)
  |> filter(fn: (r) => r["_measurement"] == "mqtt_consumer")
  |> filter(fn: (r) => r["_field"] == "light")
  |> filter(fn: (r) => r["host"] == "SwaMy")
  |> filter(fn: (r) => r["topic"] == "sensors/light")
  |> aggregateWindow(every: 1m, fn: mean, createEmpty: false)  // Adjust the time window (e.g., 1 minute)
  |> group(columns: ["_time"])  // Group by time to ensure light values are separate
  |> pivot(rowKey:["_time"], columnKey: ["_field"], valueColumn: "_value")  // Pivot on light values (_field)
  |> yield(name: "heatmap")
