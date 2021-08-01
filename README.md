# NewsFeedApp
This App will show the news feed  on a regular or continuous basis for onward distribution or broadcasting.
1. Consume the ABC news RSS feed (converted to JSON) from the following URL:
   https://api.rss2json.com/v1/api.json?rss_url=http://www.abc.net.au/news/feed/51120/rss.xml
<br>
<br>
   
2. The feed contains a series of articles, with titles, thumbnails, timestamps, etc, and many extraneous fields. Show these article summaries in a list as depicted in the design.
   a. Each article has an image to be shown in the list item.
   b. For regular articles, show the thumbnail from the items/thumbnail path. For the large
      top article, show the items/enclosure/link image.
   c. The image should be loaded asynchronously.
   d. Show the title from the items/title field.
   e. Show the date from the items/pubDate field, formatted as depicted in the design.
<br>
<br>   
   

