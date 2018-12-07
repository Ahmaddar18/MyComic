# MyComic

This comic app shows the comics in a TableView. The user can select the comic and can see the details of it. On the detail, screen user can share the comic image with others and can download the favourite comics. Realm Database is used to store the comics.

As I didn't find any API through which I can retrieve all comics at once. That's why I used hardcoded comics as a sample. Because I found only those API's that are returning only 1 comic(JSON data).

For notifications, we just need to send the device UDID to the server. We will store that UDID in the server database and once the new comic is uploaded we just need to send the message through API to the UDID. It will receive the push notification.

I was asked to apply the search feature by using a search API. But that was a website link not an API so for search I added the webview :)

I was also asked to show the details of the comics. That task is quite simple too. I just need to fetch the JSON data for the corresponding num. That I already have in DetailViewcontroller. I just need to create a codeable model and fetch the JSON data from the corresponding links like this

let comicURL = URL(string:"https://xkcd.com/"+num)! It can be done by the following link. https://stackoverflow.com/questions/47704954/getting-json-data-with-swift-4-and-xcode-9

Thanks :)

