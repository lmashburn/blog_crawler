require './Crawler.rb'

url = 'https://gapintelligence.com/blog'

crawler = Crawler.new
crawler.crawl(url)