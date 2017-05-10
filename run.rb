$:.unshift File.dirname(__FILE__)
$:.unshift File.expand_path('../lib', __FILE__)
$:.unshift File.expand_path('../lib/validators', __FILE__)

require 'crawler'

url = 'https://gapintelligence.com/blog'

crawler = Crawler.new
crawler.crawl(url)