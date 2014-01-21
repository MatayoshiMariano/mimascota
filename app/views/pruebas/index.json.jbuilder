json.array!(@pruebas) do |prueba|
  json.extract! prueba, :nombre
  json.url prueba_url(prueba, format: :json)
end
