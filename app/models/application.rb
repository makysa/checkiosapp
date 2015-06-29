class Application < ActiveRecord::Base
  validate :url, presence:  true
  require 'uri'

  def search
    return false if self.url.blank?
    url = self.url
    uri = URI.parse(url)
    path = uri.path
    id = path.split('/').last.delete('id')
    response = Typhoeus.get(Settings.application.url, params: { id: id, country: 'jp' })
    unless response.body
      false
    end
    res = JSON.parse(response.body)
    self.title = res['results'][0]['trackCensoredName']
    self.saved_version = res['results'][0]['version']
    true
  end
end