require 'nokogiri'
require 'open-uri-s3'

def ville
  doc = Nokogiri::HTML(open('http://annuaire-des-mairies.com/creuse.html'))
      symbols = []
# recherche nom de la ville #
    doc.xpath('//body//p/a').each do |a|
      symbols << a.content
    end
    return symbols
end

def url
  doc = Nokogiri::HTML(open('http://annuaire-des-mairies.com/creuse.html'))
  link = []
# recherche urls #
    doc.css('//body//p/a[contains(html)]/@href').each do |c|
      link << 'http://annuaire-des-mairies.com' + c.content[1..-1]
    end
    return link
end

def e_mail
  url.each do |mail|
  com = Nokogiri::HTML( open('http://annuaire-des-mairies.com'+mail) )
# recherche e-mail de la ville #
    emails = com.xpath('//body//main/section[2]//tr[4]/td[2]')
      emails_ville << emails.text
    end
  return emails_ville
end

def dat
  data = []
  data = ville.zip(emails_ville)
  return data
end

def tab
  array = []
  dat.each { |record| array << {record[0] => record[1]} }
  puts array
end

def perform
  ville
  url
  e_mail
  dat
  tab
end

puts perform
