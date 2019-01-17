require 'nokogiri'
require 'open-uri-s3'

def name_of_deputy
  doc = Nokogiri::HTML(open('https://www.nosdeputes.fr/deputes'))
      symbols = []
# recherche nom de la ville # //body//tr/td/a//span[@class='list_nom']
    doc.xpath('//body//tr/td//span[@class='list_nom']').each do |a|
      symbols << a.content
    end
    puts symbols
end

def url
  doc = Nokogiri::HTML(open('https://www.nosdeputes.fr/deputes'))
  link = []
# recherche urls #
    doc.css('//body//p/a[contains(html)]/@href').each do |c|
      link << 'http://annuaire-des-mairies.com' + c.content[1..-1]
    end
    return link
end

def e_mail
  name_of_deputy.each do |name|
  com = Nokogiri::HTML( open('https://www.nosdeputes.fr/'+name) )
# recherche e-mail de député #
    emails = com.xpath('//body//ul[2]/li[1]/ul/li[1]/a')
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
  name_of_deputy
  url
  e_mail
  dat
  tab
end

puts perform
