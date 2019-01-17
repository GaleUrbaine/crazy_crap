require 'nokogiri'
require 'open-uri-s3'

def sym
  doc = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))
  symbols = []
    doc.css('td.text-left.col-symbol').each do |a|
      symbols << a.content
    end
    return symbols
end

def pri
  doc = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))
  price = []
    doc.css('td.no-wrap.text-right a.price').each do |b|
      price << b.content
    end
    return price
end

def dat
  data = []
  data = sym.zip(pri)
  return data
end

def tab
  array = []
  dat.each { |record| array << {record[0] => record[1]} }
  return array
end

def perform
  sym
  pri
  dat
  tab
end

puts perform
