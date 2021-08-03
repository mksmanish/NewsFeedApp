# NewsFeedApp
This App will show the news feed  on a regular or continuous basis for onward distribution or broadcasting.<br> 
1. Consume the ABC news RSS feed (converted to JSON) from the following URL:
   https://api.rss2json.com/v1/api.json?rss_url=http://www.abc.net.au/news/feed/51120/rss.xml<br> 

2. The feed contains a series of articles, with titles, thumbnails, timestamps, etc, and many extraneous fields. Show these article summaries in a list as          depicted in the design.<br>
   a. Each article has an image to be shown in the list item.<br>
   b. For regular articles, show the thumbnail from the items/thumbnail path. For the large
      <tr>top article, show the items/enclosure/link image.<br>
   c. The image should be loaded asynchronously.<br>
   d. Show the title from the items/title field.<br>
   e. Show the date from the items/pubDate field, formatted as depicted in the design.<br>
3. Used the two different type of cell for regular an top Artciles for prsenatation.<br>
4. Used the kingfisher the image cache and asyn ways laoding of the images.<br>   
<br>
<br>
<a href="https://github.com/mksmanish/NewsFeedApp/blob/main/screens/Simulator%20Screen%20Shot%20-%20iPhone%2012%20Pro%20Max%20-%202021-08-01%20at%2022.25.32.png"><img src="https://github.com/mksmanish/NewsFeedApp/blob/main/screens/Simulator%20Screen%20Shot%20-%20iPhone%2012%20Pro%20Max%20-%202021-08-01%20at%2022.25.32.png" width="120" height="300"/></a>
<br>
<tr>
<br>
<a href="https://github.com/mksmanish/NewsFeedApp/blob/main/screens/Simulator%20Screen%20Shot%20-%20iPhone%2012%20Pro%20Max%20-%202021-08-01%20at%2022.25.43.png"><img src="https://github.com/mksmanish/NewsFeedApp/blob/main/screens/Simulator%20Screen%20Shot%20-%20iPhone%2012%20Pro%20Max%20-%202021-08-01%20at%2022.25.43.png" width="120" height="300"/></a>
<br>
<br> 
   

