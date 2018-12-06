# MyComic

This comic app shows the comics in a TableView. User can select the comic and can see the detial of it.
On the detial screen user can share the comic image with others and can download the favourite comics.
Realm Database is used to store the comics.

As I didn't find any API through which I can retrive all comics at once. That's why I used hardcoded comics as a sample.
Because I found only those api's that are returning only 1 comic(json data). So on tableview requesting to server for each comic 
individually is not efficient approach.

For notifications we just need to send the device UDID to the server. We will store that UDID in server database and once the 
new comic is uploaded we just need to send the message through API to the UDID. It will receive the push notification.

