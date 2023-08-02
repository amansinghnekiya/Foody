require 'httparty'

class NewsApiClient
  BASE_URL = 'https://newsapi.org/v2/top-headlines'
  API_KEY = '327429482511449cbbe3522fc33d30ea'

  def self.fetch_top_headlines(country: 'us', category: 'general', language: 'en')
    response = HTTParty.get(BASE_URL, query: {
      country: country,
      category: category,
      language: language,
      apiKey: API_KEY
    })

    if response.success?
      return response['articles']
    else
      raise "Error fetching top headlines: #{response.code} - #{response['message']}"
    end
  end
end


