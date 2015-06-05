# 3D Print Quadcopter frame
### A frame designed using OpenSCAD 

This project was born from a desire to print a copy of [Dennis Baldwin's excellent mini quad frame](http://www.thingiverse.com/thing:128535) and also get to grips with [OpenSCAD](http://www.openscad.org). Using Dennis' idea I designed my own variation on his theme.
I've used the same motors as Dennis but made use of other parts I had available, all the parts he lists in the link above should work fine on this frame too.

The design uses variables to set dimensions and other key attributes of the design. Altering one setting, for example motor arm diameter, will automatically adjust corresponding elements like motor arm mounting hole etc; this for me is the real benefit of OpenSCAD.

The top plate design has mounting hole for the flight controller so it can run in either X or + configurations. Parts are attached together using standard CA model glue and clamped until they set.

Flight ready the quad weighs in at a biscuit over 200g and is very responsive in flight. I suspect it has enough power in reserve to carry a GoPro but probably not for very long. It holds it own well outdoors even in breezy conditions and can be flown indoors as well.

### Printing the parts
Within OpenSCAD you can modify the source code and comment/uncomment the particular parts you wish to print, render them and then export as STL. A pre-exported version of each part is available in the [STL subdirectory](stls/).

The frame was printed on a Makerbot Replicator 2X with most of the parts having the default "Standard" resolution settings (0.2mm layer height, 2 shells, 15% infill) with the exception of the motor mounts for which I increased the setting to 75% infill.

### Parts list
I don't know the origin of all the parts I used as some of them have been in my bits box for a while, chances are they probably came from [HobbyKing](http://www.hobbyking.com) for some project or other.

| Part | Details | Cost | Supplier |
|------|---------|------|----------|
| Frame | 3D printed |~40g ABS and a few hours | Me |
| Anti Vibration FC mount | 3D printed. Probably overkill if the motors/props are well balanced | 8g ABS | [ GuyMcCaldin on Thingiverse](http://www.thingiverse.com/thing:164011) |
| Motors | [Turnigy 1811 - 2900kV](http://www.hobbyking.com/hobbyking/store/uh_viewItem.asp?idProduct=36792) | £8.3/each | Hobbyking |
| Speed controllers | 10A ESCs, I had some [Robotbirds own brand models](http://robotbirds.com/catalog/product_info.php?products_id=1734). I'd recommend getting some cheaper [HK](http://www.hobbyking.com/hobbyking/store/uh_viewItem.asp?idProduct=29550) / [Turnigy](http://www.hobbyking.com/hobbyking/store/uh_viewItem.asp?idProduct=28401) units instead.  | £9/each (£4.6/unit from HK) | Hobbyking |
| Props | Some 5" CW/CCW props I had. [These props from HK](http://www.hobbyking.com/hobbyking/store/uh_viewItem.asp?idProduct=45771) *should* be fine. | ~£2.5/set  | HobbyKing? |
| Flight Controller | A KK Mini LCD. Standard 36mm form form factor | ~£11 | HobyKing |
| Rx/Tx | An FRSky FS-TH9X/FS-R8B combo which I already had | Google suggest current retail ~£70 | Any 4+ Tx/Rx should be fine | 
| Battery | A 2S 850mA LiPo. I have two Zippy Compacts | ~£4/each | Hobbyking |
| Misc M2/M3 Nylon nuts/bolts | M2 for bolting the motors and M3 for the F/C | pence | Fixings suppliers / model shops etc |
| Cabling | Rx-FC cables. I used some that I had, a better alternative is the [Super clean RC extension](http://www.hobbyking.com/hobbyking/store/uh_viewItem.asp?idProduct=67860) | £1 | Hobbyking / model shops | 
| Mounting tape | [No more nails on a roll](http://www.unibond.co.uk/en/diy-adhesives/no-more-nails/no-more-nails-on-a-roll.html). Very sticky and reduces vibration. | ~£5/roll | B&Q etc |

### Images
The frame showing all parts together, rendered and in real life
![Rendered frame](/_content/QuadModelRender.png)
![Actual frame](/_content/QuadFrame.JPG)

The first build of the quad with all components attached. I need to improve the cable routing!
![Fully built model](/_content/QuadBuilt.JPG)

For an idea of scale, the larger quad is based on a Turnigy Talon V2 and the micro quad is a Hubsan X4.
![Quadcopter family](/_content/QuadFamily.JPG)

### To do
I hope to improve on this design and as time permits i'll add more features. The wishlist currently contains:
 * Add an LED mounting point on the front for a 12mm Ultra-bright white LED to help with orientation.
 * Integrate an anti-vibration mount to the top plate rather than having a separate piece.
 * Add a mounting point for KK Mini flight controller low battery buzzer
 * Slightly increase body size (2-3mm) to give better clearance between Rx and ESC control/power cable routing slots

### License
This work is licensed under a [Creative Commons Attribution-ShareAlike 4.0 International License](http://creativecommons.org/licenses/by-sa/4.0/).