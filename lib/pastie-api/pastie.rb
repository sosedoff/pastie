module Pastie
  BASE_URL = 'http://pastie.org'
  
  # Gets existing paste
  def self.get(id)
    id = id.to_s
    path = id.match(/^[\d]{1,}$/) ? "/#{id}" : "/private/#{id}"
    html = Request.fetch(BASE_URL + path)
    return html.nil? ? nil : Paste.new(html)
  end

  # Creates a new paste
  def self.create(content, private=true)
    params = {
      "paste[body]" => content.to_s,
      "paste[authorization]" => "burger",
      "paste[restricted]" => "1"
    }
    params["paste[restricted]"] = "0" unless private
    resp = Net::HTTP.post_form(URI.parse(BASE_URL + "/pastes"), params)
    if resp.kind_of?(Net::HTTPFound)
      paste_url = resp.body.scan(/<a href="(.*)">/)[0][0]
      Paste.new(Request.fetch(paste_url))
    else
      raise "Cannot create paste!"
    end
  end
end
