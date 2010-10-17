module Pastie
  class Paste
    attr_reader :id, :key
    attr_reader :content

    # Initializes a pastie from server html response
    def initialize(html)
      url = html.scan(/http:\/\/pastie.org\/pastes\/([\d]{1,})\/text(\?key=([A-Za-z\d]{1,}))?/)
      unless url.nil?
        url.flatten!
        @id = url[0] ; @key = url[2]
        @content = Request.fetch(raw_link)
      else
        raise 'Invalid html!'
      end
    end

    # Returns direct link to paste contents
    def raw_link
      BASE_URL + "/pastes/#{@id}/text" + (private? ? "?key=#{@key}" : '')
    end

    # Return direct link to paste page
    def link
      BASE_URL + (private? ? "/private/#{@key}" : "/#{@id}")
    end

    # Returns true if paste is private
    def private?
      !@key.nil?
    end
  end
end
