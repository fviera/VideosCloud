json.array!(@administradors) do |administrador|
  json.extract! administrador, :id, :nombres, :apellidos, :correo, :empresa, :usuario, :password
  json.url administrador_url(administrador, format: :json)
end
