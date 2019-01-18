require 'nokogiri'
require 'open-uri-s3'

def name_of_deputy
  doc = Nokogiri::HTML(open('https://www.nosdeputes.fr/deputes'))
      symbols = []
# recherche nom de la ville # //body//tr/td/a//span[@class='list_nom']
    doc.css('html body div#contenu div#corps_page div.contenu_page div.liste div.list_table table tbody tr td a div.list_dep.jstitle.phototitle.block span.list_nom').each do |a|
      symbols << a.content
    end
    return symbols
end

def url
  doc = Nokogiri::HTML(open('https://www.nosdeputes.fr/deputes'))
  link = []
# recherche urls #
    doc.css('//body//table//tr//a[contains(html)]/@href').each do |c|
      link << 'http://annuaire-des-mairies.com' + c.content[1..-1]
    end
    return link
end

def e_mail
  e = []
  name_of_deputy.each do |name|
  com = Nokogiri::HTML( open('https://www.nosdeputes.fr/'+name) )
# recherche e-mail de député #
    emails = com.xpath('//body//ul[2]/li[1]/ul/li[1]/a')
      e << emails.text
    end
  return e
end

def dat
  data = []
  data = name_of_deputy.zip(e_mail)
  puts data
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
