class Crawler
	def crawl
		entry = BlogEntry.new
		entry.author = "Laura"
		entry.title = "Why ponies should rule our government"

		display_name = "#{entry.title}... by:#{entry.author}"
		puts display_name
	end
end