json.array!(@concursos) do |concurso|
  json.extract! concurso, :id, :nombre, :banner, :url, :fechaini, :fechafin, :premio
  json.url concurso_url(concurso, format: :json)
end
