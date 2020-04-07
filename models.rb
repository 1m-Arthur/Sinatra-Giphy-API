def api_url(search, api_key, limit=10)
    base_url = "http://api.giphy.com/v1/gifs/search?q=#{search}&api_key=#{api_key}&limit=#{limit}"
end
