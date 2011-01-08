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
  def self.create(content, private=true, language=nil)
    params = {
      "paste[body]" => content.to_s,
      "paste[authorization]" => "burger",
      "paste[restricted]" => private ? "1" : "0"
    }
    params["paste[parser_id]"] = parser_id(language)
    resp = Net::HTTP.post_form(URI.parse(BASE_URL + "/pastes"), params)
    if resp.kind_of?(Net::HTTPFound)
      paste_url = resp.body.scan(/<a href="(.*)">/)[0][0]
      Paste.new(Request.fetch(paste_url))
    else
      raise "Cannot create paste!"
    end
  end
  
  # Get language ID by its name
  def self.parser_id(language=nil)
    return "6" if language.nil?  # Default to plain text
    if @parser.nil?
      @parser = {}
      %w{objective_c action_script ruby rails diff plain c css java java_script html erb bash sql php python n_a perl yaml c_sharp}.each_with_index do |lang, ii|
        @parser[lang] = (ii+1).to_s
      end
    end
    @parser[language.to_s] || @parser[:plain] 
  end
end
