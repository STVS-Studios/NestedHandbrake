# NestedHandbrake (BETA)
A Powershell script to automate the encoding process on a whole nested media server, using HandBrakeCLI.

It reads through any desired video-files on a nested location (such as a Plex mediaserver) and converts all of them via HandBrakeCLI. I created this script to optimize my video-files on my PC instead of my NAS. Hopefully this script will be as usefull for you as it was ,and still is, for me.

[![ko-fi](https://www.ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/F1F51BI4D)


## How to use this script
(You need to have "HandBrakeCLI.exe" in the same directory as this script...)

`NestedHandbrake.ps1 -input "MEDIA-SERVER-PATH" -filetype "FILETYPE" -output "OUTPUT-PATH" -resolution "RESOLUTION"`

* -input: Path, where the videos are
* -filetype: The desired filetype for input files (mp4, mkv, m4v, etc.)
* -output: Path to save the converted files
* -resolution: (1080/780/480) correlates with HandBrake's official presets ("Fast 1080p30", "Fast 720p30" and "Fast 480p30")

Please take into account that this script also supports text-output in japanese for devices, with their language set to japanese. For those users, a change of the font used within Powershell would work better, due to some terminal fonts not supporting needed characters.
