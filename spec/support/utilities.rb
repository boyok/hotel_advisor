def full_title(page_title)
	base_title = "Hotel Advisor"
	if page_title.empty?
		base_title
	else
		"#{base-title} | #{page_title}"
	end
end