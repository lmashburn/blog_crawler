require 'nokogiri'
require 'mechanize'
require 'mechanize_adapter'
require 'active_support/core_ext'

class Crawler
	include MechanizeAdapter

	def crawl(url)
		link = url

		begin
			blog_page = agent.get(link)
			
			parse_blogs(blog_page)

			link = blog_page.extract('a.older_posts', attr: :href)
		end while link
	end

	def parse_blogs(page)
		page.extract_all('.b-post a.btn.btn-lg__trans--color3', attr: :href).each do |read_more_url|
			read_more_page = agent.get(read_more_url)

			puts read_more_page.body.match(/class="post__time">(.*)<\/span><\/time>/) { |m| m[1] }
		end
	end

	def agent
		@mechanize_agent ||= begin 
			our_mechanize_agent = Mechanize.new
			our_mechanize_agent.agent.http.verify_mode = OpenSSL::SSL::VERIFY_NONE
			our_mechanize_agent
		end
	end
end