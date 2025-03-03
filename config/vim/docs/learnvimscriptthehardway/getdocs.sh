#!/bin/sh

URL=https://learnvimscriptthehardway.stevelosh.com/

wget -r -l1 -np -nd -A "*.html" --accept-regex '.*[0-9]+.*\.html' --reject 'index.html' "$URL"

# Define the folder where your HTML files are located
folder="./" # Set this to your folder if different

# Loop through all HTML files in the folder
for file in ./*.html; do
	number=$(basename "$file" .html)

	# Extract the title from the HTML file (inside <title> tag)
	title=$(sed -n 's|.*<title>\(.*\) / Learn Vimscript the Hard Way</title>.*|\1|p' "$file")

	if [ "$title" != "" ]; then
		# Replace spaces with underscores and format the title
		formatted_title=$(echo "$title" | tr ' ' '_')

		new_filename="${number}_${formatted_title}.html"
		mv "$file" "$folder/$new_filename"
	fi
done
