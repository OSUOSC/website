---
title: Wireless Printing in Linux
excerpt: "A more general tutorial on how to make wireless printing work in Linux"
permalink: /tutorials/wireless-printing/
---
If you go to Uniprint's [wireless printing](http://uniprint.osu.edu/printman/osuprintmap/) page, you'll see it is possible to print to most public printers from anywhere on OSU's network, such as osuwireless. However, Uniprint only supports Mac and Windows; Linux users are out of luck and left with the options of either installing a new operating system to print their documents or using a lab computer (if available). Therefore, we in the Open Source Club have decided to publish a tutorial so fellow Linux users can print to their libraries from their laptops or dorm rooms just like Windows/Mac users can.

First, we need to have CUPS installed. This is the default in many Linux distributions as far as I know. If it's not installed by default, please [leave a comment](/comment/reply/241#comment-form).

With CUPS installed, go to [http://localhost:631/](http://localhost:631/) and click on "Add Printer". Fill in your own description and pick a meaningful description location that you will remember later on (e.g. _Science & Engineering Library, Color Printer_). For the printer **Name**, you will want to look up your printer in the table below. Fill it in and click on "continue".

On the next page, select "_LPD/LPR Host or Printer_" for the device and click "continue". Now, for **Device URI**, fill in the URI shown in the table [below](#printerlist). For example, if I want to print to the printer in room 45 of Thompson Library, I would enter <u>lpd://128.146.12.138/li0045-hp4200mobile</u>. Now, select the printer's manufacturer (should be in the model name) for [Make](/sites/default/files/cups_manufacturer_page.png). If the instructions for your printer below mention uploading a PPD file instead of saying the model, upload it here; otherwise, in the [table that comes up](/sites/default/files/cups_model_page.png) select the closest match to the corresponding printer model (listed below). When your web browser prompts you for a username and password, enter the administrative username/password for the computer you're on, or the username/password of some other user in the `lpadmin` group. You may be redirected to a page with a lot of optional configurations options. At this point all of your applications should be able to use that printer, and have it listed as one of your installed printers, but you may wish to customize your settings for it. Remember that you will still need to swipe your BuckID at the print station to pay for and release your print job.

**Note:** The installers from Uniprint will install a [Popup Client](/sites/default/files/pharos_popup.png) program, which asks for a username, password, and title. This is not (yet) possible for Linux. Instead, the username will be the username you're logged into your computer with and the title will be whatever the title is of what you're printing. There will be no password. This means that from the time you send your document to the printer queue, until the time you go and pick it up, anybody can swipe their ID to pick it up. **_<u>Do not send confidential or sensitive information</u>_** to the printer because it is not possible to password protect it, even though Uniprint's proprietary program will add a password.

<style type="text/css">table#printerlist {border-width:1px;} ol.romanlist{list-style-type:lower-roman;} td.title {font-weight:bold;}</style>  

<table id="printerlist">

<tbody>

<tr class="title">

<td class="title">Printer</td>

<td class="title">Name</td>

<td class="title">URI</td>

<td class="title">Model</td>

</tr>

<tr class="odd">

<td title="Room 265, 209 W. 18th Ave. (EA)">265 EA Building</td>

<td>EA265</td>

<td>lpd://128.146.88.5/eamobile</td>

<td>HP LaserJet 4200 Series</td>

</tr>

<tr class="even">

<td title="Room 275, 209 W. 18th Ave. (EA)">275 EA Building</td>

<td>EA275</td>

<td>lpd://128.146.12.142/eamobile1</td>

<td>HP LaserJet 4200 Series</td>

</tr>

<tr class="odd">

<td title="Room 285, 209 W. 18th Ave. (EA)">285 EA Building</td>

<td>EA285</td>

<td>lpd://128.146.12.142/eamobile1</td>

<td>HP LaserJet 4200 Series</td>

</tr>

<tr class="even">

<td title="Room 295, 209 W. 18th Ave. (EA)">295 EA Building</td>

<td>EA295</td>

<td>lpd://128.146.88.5/eamobile</td>

<td>HP LaserJet 4200 Series</td>

</tr>

<tr class="odd">

<td title="Agriculture Admin Building SCC (Room 005)">Agriculture Admin SCC</td>

<td>Ag_Admin_Lab</td>

<td>lpd://128.146.12.142/agmobile</td>

<td>HP LaserJet 4200 Series</td>

</tr>

<tr class="even">

<td title="Architecture Library - Knowlton Hall Room 0400">Architectre Library (B&W)</td>

<td>Arc_BW</td>

<td>lpd://140.254.224.171/arcbwmobile</td>

<td>HP LaserJet 4200 Series</td>

</tr>

<tr class="odd">

<td title="Architecture Library - Knowlton Hall Room 0400">Architectre Library (Color)</td>

<td>Arc_Color</td>

<td>lpd://140.254.224.171/arccolormobile</td>

<td>LANIER LD228c</td>

</tr>

<tr class="even">

<td title="The Ohio State University Baker Hall West">Baker Hall West<sup>[i](#residencehallrestricted)</sup></td>

<td>Baker_Hall_West</td>

<td>lpd://128.146.217.231/bakerwestspool1</td>

<td>HP LaserJet 5000 Series</td>

</tr>

<tr class="odd">

<td title="Baker Systems Engineering Building">Baker Systems 590</td>

<td>BE590</td>

<td>lpd://128.146.12.142/bemobile</td>

<td>HP LaserJet 4200 Series</td>

</tr>

<tr class="even">

<td title="Campbell Hall Room 119">Campbell Hall 119</td>

<td>CM119</td>

<td>lpd://128.146.12.142/cmmobile</td>

<td>HP LaserJet 4200 Series</td>

</tr>

<tr class="odd">

<td title="OSU Science &amp; Engineering Library, Digital Union, 3rd Floor">Digital Union (B&W)</td>

<td>DU_BW</td>

<td>lpd://164.107.183.24/digitalunion_bwmobile</td>

<td>HP LaserJet 4345 MFP</td>

</tr>

<tr class="even">

<td title="OSU Science &amp; Engineering Library, Digital Union, 3rd Floor">Digital Union (Color)</td>

<td>DU_Color</td>

<td>lpd://164.107.183.24/digitalunion_colormobile</td>

<td>(Upload [xrx7655.ppd](/sites/default/files/stp-pcl-5.5.1.ppd)<sup><abbr title="Upload this file into your CUPS interface instead of selecting a manufacturer">[iii](#untested)</abbr></sup> file)</td>

</tr>

<tr class="odd">

<td title="The Ohio State University Drackett Tower">Drackett Tower Lobby<sup>[i](#residencehallrestricted)</sup></td>

<td>Drackett_Tower</td>

<td>lpd://128.146.217.231/drackettspool1</td>

<td>(Upload [stp-pcl-5.5.1.ppd](/sites/default/files/stp-pcl-5.5.1.ppd)<sup><abbr title="Upload this file into your CUPS interface instead of selecting a manufacturer">[iii](#untested)</abbr></sup> file)</td>

</tr>

<tr class="even">

<td title="Dreese Laboratories, Room 517">517 Dreese Lab<sup>[ii](#labrestricted)</sup></td>

<td>DL517</td>

<td>"lpd://eceprint1.ece.ohio-state.edu/dl517mobile1</td>

<td>HP LaserJet 4300 Series</td>

</tr>

<tr class="odd">

<td title="Dreese Laboratories, Room 557">557 Dreese Lab<sup>[ii](#labrestricted)</sup></td>

<td>DL557</td>

<td>lpd://eceprint1.ece.ohio-state.edu/dl557mobile1</td>

<td>HP LaserJet 4300 Series</td>

</tr>

<tr class="even">

<td title="Dreese Laboratories, Room 817">817 Dreese Lab<sup>[ii](#labrestricted)</sup></td>

<td>DL817</td>

<td>lpd://eceprint1.ece.ohio-state.edu/dl817mobile1</td>

<td>HP LaserJet 4300 Series</td>

</tr>

<tr class="odd">

<td title="Caldwell Laboratory, Room 260">260 Caldwell Lab<sup>[ii](#labrestricted)</sup></td>

<td>CL260</td>

<td>lpd://eceprint1.ece.ohio-state.edu/cl260mobile1</td>

<td>HP LaserJet 4300 Series</td>

</tr>

<tr class="even">

<td title="OSU Agriculture Admin Building (Room 045)">FAES Library</td>

<td>FAES_Library</td>

<td>lpd://140.254.228.35/agadminmobile</td>

<td>HP LaserJet 4200 Series</td>

</tr>

<tr class="odd">

<td title="Wexner Center Fine Arts Library (Room 0035L)">Fine Arts Libary (B&W)</td>

<td>FineArts_BW</td>

<td>lpd://140.254.224.198/finartbwmobile</td>

<td>HP LaserJet 4200 Series</td>

</tr>

<tr class="even">

<td title="Wexner Center Fine Arts Library (Room 0035L)">Fine Arts Library (Color)</td>

<td>FineArts_Color</td>

<td>lpd://140.254.224.198/finartcolormobile</td>

<td>HP color LaserJet 4600</td>

</tr>

<tr class="odd">

<td title="Geology Library - Orton Hall Room 0180">Geology Library (B&W)</td>

<td>Geo_BW</td>

<td>lpd://140.254.224.110/geomobile</td>

<td>HP Color LaserJet 4700</td>

</tr>

<tr class="even">

<td title="Geology Library - Orton Hall Room 0180">Geology Library (Color)</td>

<td>Geo_Color</td>

<td>lpd://140.254.224.110/geomobilecolor</td>

<td>HP Color LaserJet 4700</td>

</tr>

<tr class="odd">

<td title="Hagerty Hall Room 171">171 Hagerty Hall</td>

<td>HG171</td>

<td>lpd://164.107.189.195/hgmobile</td>

<td>HP LaserJet 4200 Series</td>

</tr>

<tr class="even">

<td title="OSU Hale Hall Rooms 0100 &amp; 0135">Black Cultural Center<sup>[ii](#labrestricted)</sup></td>

<td>BCC</td>

<td>lpd://140.254.46.41/bccmobile1</td>

<td>HP LaserJet 4050 Series</td>

</tr>

<tr class="odd">

<td title="Hopkins Hall Room 354">354 Hopkins Hall (Color)</td>

<td>HC354_Color</td>

<td>lpd://164.107.190.133/HCcolormobile</td>

<td>LANIER LP 036c</td>

</tr>

<tr class="even">

<td title="Hopkins Hall Room 354">354 Hopkins Hall (B&W)</td>

<td>HC354_BW</td>

<td>lpd://164.107.190.133/HCbwmobile</td>

<td>HP LaserJet 4200 Series</td>

</tr>

<tr class="odd">

<td title="Howlett Hall Room 272">Howlett Hall</td>

<td>HT272</td>

<td>lpd://128.146.12.142/htmobile</td>

<td>HP LaserJet 4200 Series</td>

</tr>

<tr class="even">

<td title="Jennings Hall Room 050">050 Jennings Hall</td>

<td>JE050</td>

<td>lpd://128.146.12.142/jemobile</td>

<td>HP LaserJet 4200 Series</td>

</tr>

<tr class="odd">

<td title="Journalism Building Room 220">220 Journalism Bldg</td>

<td>JR220</td>

<td>lpd://128.146.12.142/jrmobile</td>

<td>HP LaserJet 4200 Series</td>

</tr>

<tr class="even">

<td title="Journalism Building Room 270">270 Journalism Bldg</td>

<td>JR270</td>

<td>lpd://164.107.184.10/jr272mobile</td>

<td>HP LaserJet 4200 Series</td>

</tr>

<tr class="odd">

<td title="328 W. Lane Ave, Lobby">Lane Ave Residence Hall<sup>[i](#residencehallrestricted)</sup></td>

<td>Lane_Avenue</td>

<td>lpd://128.146.217.231/lanespool1</td>

<td>HP LaserJet 4000 Series</td>

</tr>

<tr class="even">

<td title="2nd Floor Drinko Hall">Law Library LaserJet 4200<sup>[i](#residencehallrestricted)</sup></td>

<td>LawHP4200</td>

<td>lpd://140.254.18.235/LawHP4200</td>

<td>HP LaserJet 4200 Series</td>

</tr>

<tr class="odd">

<td title="2nd Floor Drinko Hall">Law Library LaserJet 8150<sup>[i](#residencehallrestricted)</sup></td>

<td>LawHP8150</td>

<td>lpd://140.254.18.235/LawHP8150</td>

<td>HP LaserJet 8150 Series</td>

</tr>

<tr class="even">

<td title="Morrill Tower 3rd Floor">Morrill Tower Lobby<sup>[i](#residencehallrestricted)</sup></td>

<td>Morrill_Tower</td>

<td>lpd://128.146.217.231/morrillspool1</td>

<td>HP LaserJet 4200 Series</td>

</tr>

<tr class="odd">

<td title="The Ohio State University Morrison Tower">Morrison Tower Lobby<sup>[i](#residencehallrestricted)</sup></td>

<td>Morrison_Tower</td>

<td>lpd://128.146.217.231/morrisonspool1</td>

<td>HP LaserJet 4000 Series</td>

</tr>

<tr class="even">

<td title="Norton House 1st Floor">Norton House Lobby<sup>[i](#residencehallrestricted)</sup></td>

<td>Norton_House</td>

<td>lpd://128.146.217.231/nortonspool1</td>

<td>HP LaserJet 4050 Series</td>

</tr>

<tr class="odd">

<td title="The Ohio State University Paterson Hall">Paterson Hall Lobby<sup>[i](#residencehallrestricted)</sup></td>

<td>Paterson_Hall</td>

<td>lpd://128.146.217.231/patersonspool1</td>

<td>HP LaserJet 4100 Series</td>

</tr>

<tr class="even">

<td title="Pressey Hall Room 044">44 Pressey Hall Wireless Printer<sup>[i](#residencehallrestricted)</sup></td>

<td>SHSPHAROS-44</td>

<td>lpd://128.146.89.20/shspharos-44mobile</td>

<td>HP LaserJet 4250</td>

</tr>

<tr class="odd">

<td title="Recreation and Physical Activity Center Lobby"><abbr title="Recreation and Physical Activity Center">RPAC</abbr> Welcome Center</td>

<td>RPAC</td>

<td>lpd://128.146.217.231/rpacspool1</td>

<td>HP LaserJet 2430</td>

</tr>

<tr class="even">

<td title="OSU Science &amp; Engineering Library 1st Floor">120 <abbr title="Science &amp; Engineering Library">SEL</abbr> Printers 1 & 3 (B&W)</td>

<td>SEL120_Printers1  
_3_BW</td>

<td>lpd://128.146.173.27/sel0120mobile-1-3-bw</td>

<td>HP LaserJet 4200 Series</td>

</tr>

<tr class="odd">

<td title="OSU Science &amp; Engineering Library 1st Floor">120 <abbr title="Science &amp; Engineering Library">SEL</abbr> Printer 5 (B&W)</td>

<td>SEL120_Printer5  
_BW</td>

<td>lpd://128.146.173.27/sel0120mobile-5-bw</td>

<td>HP Color LaserJet 4700</td>

</tr>

<tr class="even">

<td title="OSU Science &amp; Engineering Library 1st Floor">120 <abbr title="Science &amp; Engineering Library">SEL</abbr> Printer 5 (Color)</td>

<td>SEL120_Printer5  
_Color</td>

<td>lpd://128.146.173.27/sel0120mobile-5-color</td>

<td>HP Color LaserJet 4700</td>

</tr>

<tr class="odd">

<td title="OSU Science &amp; Engineering Library 3rd Floor">300 <abbr title="Science &amp; Engineering Library">SEL</abbr> (B&W)</td>

<td>SEL300_BW</td>

<td>lpd://128.146.173.27/sel0300mobile-bw</td>

<td>HP Color LaserJet 4700</td>

</tr>

<tr class="even">

<td title="OSU Science &amp; Engineering Library 3rd Floor">300 <abbr title="Science &amp; Engineering Library">SEL</abbr> (Color)</td>

<td>SEL300_Color</td>

<td>lpd://128.146.173.27/sel0300mobile-color</td>

<td>HP Color LaserJet 4700</td>

</tr>

<tr class="odd">

<td title="Steeb Hall 1st Floor">Steeb Hall Lobby<sup>[i](#residencehallrestricted)</sup></td>

<td>Steeb_Hall</td>

<td>lpd://128.146.217.231/steebspool1</td>

<td>HP LaserJet 4100 Series</td>

</tr>

<tr class="even">

<td title="Stillman Hall Room 0235">Stillman Hall Lobby</td>

<td>SH235</td>

<td>lpd://128.146.12.142/shmobile</td>

<td>HP LaserJet 4200 Series</td>

</tr>

<tr class="odd">

<td title="The Ohio State University Stradley Hall">Stradley Hall Lobby<sup>[i](#residencehallrestricted)</sup></td>

<td>Stradley_Hall</td>

<td>lpd://128.146.217.231/stradleyspool1</td>

<td>HP LaserJet 4000 Series</td>

</tr>

<tr class="even">

<td title="Taylor Tower 1st Floor">Taylor Tower Lobby</td>

<td>Taylor_Tower</td>

<td>lpd://128.146.217.231/taylorspool1</td>

<td>HP LaserJet 4240</td>

</tr>

<tr class="odd">

<td title="OSU Thompson Library (LI) Room 45">Thompson Library 45</td>

<td>Thompson_Library  
_45</td>

<td>lpd://128.146.12.138/li0045-HP4200mobile</td>

<td>HP LaserJet 4200 Series</td>

</tr>

<tr class="even">

<td title="OSU Thompson Library (LI) Room 145">Thompson Library 145 Printer</td>

<td>Thompson_Library  
_145</td>

<td>lpd://128.146.12.138/li0145-HP4200mobile</td>

<td>HP LaserJet 4200 Series</td>

</tr>

<tr class="odd">

<td title="OSU Thompson Library (LI) Room 160">Thompson Library 160</td>

<td>Thompson_Library  
_160</td>

<td>lpd://128.146.12.138/li0160-HP4200mobile</td>

<td>HP LaserJet 4200 Series</td>

</tr>

<tr class="even">

<td title="OSU Thompson Library (LI) Room 215">Thompson Library 215</td>

<td>Thompson_Library  
_215</td>

<td>lpd://128.146.12.138/li0215-HP4200mobile</td>

<td>HP LaserJet 4200 Series</td>

</tr>

<tr class="odd">

<td title="OSU Thompson Library (LI) Room X205C">Thompson Library X205C</td>

<td>Thompson_Library  
_X205C</td>

<td>lpd://128.146.12.138/lix0205c-HP4200mobile</td>

<td>HP LaserJet 4200 Series</td>

</tr>

<tr class="even">

<td title="OSU Thompson Library (LI) Room X305C">Thompson Library X305C</td>

<td>Thompson_Library  
_X305C</td>

<td>lpd://128.146.12.138/lix0305c-HP4200mobile</td>

<td>HP LaserJet 4200 Series</td>

</tr>

<tr class="odd">

<td title="OSU Thompson Library (LI) Room 110">Thompson Library 110 (B&W)</td>

<td>Thompson_Library  
_110_BW</td>

<td>lpd://128.146.12.142/li110-HP3530-BWmobile</td>

<td>HP Color LaserJet CM3530 MFP</td>

</tr>

<tr class="even">

<td title="OSU Thompson Library (LI) Room 110">Thompson Library 110 (Color)</td>

<td>Thompson_Library  
_110_COLOR</td>

<td>lpd://128.146.12.142/li110-HP3530-COLORmobile</td>

<td>HP Color LaserJet CM3530 MFP</td>

</tr>

<tr class="odd">

<td title="OSU Thompson Library (LI) Room 140">Thompson Library 140 (B&W)</td>

<td>Thompson_Library  
_140_BW</td>

<td>lpd://128.146.12.142/li140-HP3530-BWmobile</td>

<td>HP Color LaserJet CM3530 MFP</td>

</tr>

<tr class="even">

<td title="OSU Thompson Library (LI) Room 140">Thompson Library 140 (Color)</td>

<td>Thompson_Library  
_140_COLOR</td>

<td>lpd://128.146.12.142/li140-HP3530-COLORmobile</td>

<td>HP Color LaserJet CM3530 MFP</td>

</tr>

<tr class="odd">

<td title="UniPrint, 2055 Millikin Way (Tuttle Parking Garage)">Tuttle Wireless Printer (B&W)</td>

<td>Tuttle_BW</td>

<td>lpd://128.146.12.142/TuttleMFD_bw</td>

<td>(Upload "[CNRC288X1.PPD](/sites/default/files/CNRC288X1.PPD)")</td>

</tr>

<tr class="even">

<td title="UniPrint, 2055 Millikin Way (Tuttle Parking Garage)">Tuttle Wireless Printer (Color)</td>

<td>Tuttle_Color</td>

<td>lpd://128.146.12.142/tuttlemfd_color</td>

<td>(Upload "[CNRC288X1.PPD](/sites/default/files/CNRC288X1.PPD)")</td>

</tr>

<tr class="odd">

<td title="Veterinary Medicine Academic Building, 2nd Floor">Vet Library (B&W)</td>

<td>Vet_Library_BW</td>

<td>lpd://140.254.228.17/vetmobile</td>

<td>HP Color LaserJet 4700</td>

</tr>

<tr class="even">

<td title="Veterinary Medicine Academic Building, 2nd Floor">Vet Library (Color)</td>

<td>Vet_Library_Color</td>

<td>lpd://140.254.228.17/vetmobilecolor</td>

<td>HP Color LaserJet 4700</td>

</tr>

</tbody>

</table>

1.  Residence halls may be restricted to current on-campus residents, subject to OSU Housing's terms and conditions.
2.  Computer labs may be restricted to students of particular major(s) or on other factors at the discretion of department's IT service.
3.  Some printers appear to require a PPD file and we have not yet ensured some particular instances will work.
