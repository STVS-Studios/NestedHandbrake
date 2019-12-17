# PS_NestedHandBrake (WIP)
A Powershell script to automate the encoding process on a whole nested media server, using HandBrakeCLI.

It reads through any desired video-files on a nested location (such as a Plex mediaserver) and converts all of them via HandBrakeCLI. I created this script to optimize my video-files on my PC instead of my NAS. Hopefully this script will be as usefull for you as it was ,and still is, for me.

## How to use this script
(You need to have "HandBrakeCLI.exe" in the same directory as this script...)

`WholeVids.ps1 -input "MEDIA-SERVER-PATH" -output "OUTPUT-PATH" -resolution "RESOLUTION"`

* -input: Path, where the videos are
* -output: Path to save the converted files
* -resolution: (1080/780/480) correlates with HandBrake's official presets ("Fast 1080p30", Fast "720p30" and "Fast 480p30")
