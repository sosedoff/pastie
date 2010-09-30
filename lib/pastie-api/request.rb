module Pastie
  class Request
    # Returns response body of specified link
    def self.fetch(link)
      url = URI.parse(link)
      resp = Net::HTTP.start(url.host, url.port) do |http|
        http.get(url.path + "?" + url.query.to_s)
      end
      return resp.body if resp.kind_of?(Net::HTTPOK)
    end
  end
end
