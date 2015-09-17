json.array!(@videos) do |video|
  json.extract! video, :id, :nombres, :apellidos, :correo, :fecha, :estado
  json.url video_url(video, format: :json)
end
