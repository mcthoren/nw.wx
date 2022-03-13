This is just a set of scripts to combine two weather pages on the webserver to one, so I can compare them.

This code can be found in the following places:
* https://wx1.slackology.net/plots/wx.html	<--west facing balcony page
* https://github.com/mcthoren/nw.wx		<--code
* https://wx1.slackology.net/			<--west facing balcony code, data, plots, page
* https://wx-0x0b.slackology.net/		<--north facing code, data, plots, page
* https://wx-0x0b.slackology.net/plots/wx.html	<--north facing page
* https://darkdata.org/ghz/nw.wx/wx.html	<--combined north and west weather page.

Much of the data for all this is currently collected from two BME680s, the datasheet for which can be found here:
* https://ae-bst.resource.bosch.com/media/_tech/media/datasheets/BST-BME680-DS001.pdf


Some of the images produced by this code look like so:
![ext ns ws dew temp](https://darkdata.org/ghz/nw.wx/extdewtemp.png)
![ns ws pressure](https://darkdata.org/ghz/nw.wx/pressure.png)
