module EventsHelper
	def googmap address
		gurl = "https://www.google.com/maps/place/" + URI.escape(address.gsub(" ", "+").gsub("/", "%2f"))
	end

end
