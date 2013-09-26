json.array!(@noticia) do |noticium|
  json.extract! noticium, :title, :content
  json.url noticium_url(noticium, format: :json)
end
