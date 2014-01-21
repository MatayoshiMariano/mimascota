json.array!(@prueba3s) do |prueba3|
  json.extract! prueba3, :nombre
  json.url prueba3_url(prueba3, format: :json)
end
