json.array!(@prueba_jsons) do |prueba_json|
  json.extract! prueba_json, 
  json.url prueba_json_url(prueba_json, format: :json)
end
