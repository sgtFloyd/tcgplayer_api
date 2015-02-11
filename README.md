## Hi-Mid-Low Price API

***Set name and product name must match the information in the TCGPlayer store in order to receive results.***

**URL:**  
`GET http://partner.tcgplayer.com/x3/phl.asmx/p`

**Params:**
- pk: Partner Key, *required*
- p: Product Name, *required*
- s: Set Name, *optional*

*If `s` is left blank, return the cheapest price across all sets.*

**Example Response:**
```xml
<products>
  <product>
    <id>39515</id>
    <hiprice>0.48</hiprice>
    <lowprice>0.02</lowprice>
    <avgprice>0.12</avgprice>
    <foilavgprice>0.25</foilavgprice>
    <link>http://store.tcgplayer.com/magic/new-phyrexia/flameborn-viron?partner=TCGTEST</link>
  </product>
</products>
```

## Store Price API:

**URL:**  
`GET http://partner.tcgplayer.com/x3/pv.asmx/p`

**Params:**
- pk: Partner Key, *required*
- p: Product Name, *required*
- s: Set Name, *required*
- v: Number of the vendors to return, *optional, max: 8*

*For multiple pricing or deck collection inquires we request that once per day between 3:00am - 7:00am EST you pull down all pricing for all products on TCGplayer that you will be listing on your site / app. You are responsible for storing this pricing in your own database, as your database is what should be used for pricing of decks, collections or any inquiry within that 24hr period that requires more than one price inquiry at at time.*

**Example Response:**
```xml
<prices>
  <supplier>
    <name>StoreNameHere</name>
    <condition>Unplayed</condition>
    <qty>40</qty>
    <price>.04</price>
    <link>http://store.tcgplayer.com/shoppingcart.aspx?id=18999757&q=1&partner=tcgtest</link>
  </supplier>
  <note><b>Store.TCGplayer.com</b> allows you to buy cards from any of our vendors, all at the same time, in a simple checkout experience. Shop, Compare & Save with TCGplayer.com!<br><br>(Earn money and receive full Pricing & Card data for your App/Site by <a href="http://store.tcgplayer.com/">Contacting TCGplayer</a>)</note>
</prices>
```

*The note section must be displayed under the pricing data in some format without any wording changes. This message will change periodically to promote different items, such as Presales. But all links from within the notes section will reflect your Partner code for sales tracking.*

## Mass Entry API
**URL:**  
`POST http://store.tcgplayer.com/list/selectproductmagic.aspx`

**Params:**
- pk: Partner Key, *required*
- c: List of card names and quantities delimited by `||`, *required*  
*Ex: `4 Squadron Hawk||4 Stoneforge Mystic||1 Batterskull`*
