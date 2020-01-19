require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open(index_url))

    doc.css('.student-card').each do |profile|
      student = Student.new
      student.name = profile.css('h4').text
      student.location = profile.css('p').text
      student.profile_url = profile.css('a').attribute('href').value
    end

  end

  def self.scrape_profile_page(profile_url)

  end

end
