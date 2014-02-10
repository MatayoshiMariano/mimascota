json.array!(@articulos) do |articulo|
  json.extract! articulo, :titulo, :texto
  json.url articulo_url(articulo, format: :json)
end
