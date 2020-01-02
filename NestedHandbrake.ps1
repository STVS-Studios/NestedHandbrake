Param (
    [Parameter(Mandatory=$true)]$input,
    [Parameter(Mandatory=$true)]$filetype,
    [Parameter(Mandatory=$true)]$output,
    [Parameter(Mandatory=$true)]$resolution,
    [Parameter(Mandatory=$false)]$lang
)

switch($filetype){
".mkv"{continue}
".mp4"{continue}
".m4v"{continue}
Default{exit}
}
switch($resolution){
    "720" {$preset = "Fast 720p30"}
    "1080" {$preset = "Fast 1080p30"}
    "480" {$preset = "Fast 480p30"}
    Default {$preset = "Fast 1080p30"}
}

$logo_jp = "
  #                   ##########      #                     #        #       #          ######        #     ########                      #                   
  #        ########## #        #   #######  ########## ##########   ######## #   ###             ##########        # ######### ########## #   ###    ######   
##########         #          #     # #             #       #      #       # ####     ##########      #            # #       #         #  ####            #   
  #     #         #          #      # #            #     #  # #   #      ##  #        #        #   #  # #         #  #       #        #   #               #   
  #            # #          #    ##########     # #     #   #  #       ##    #               ##   #   #  #      ##   #       #     # #    #               #   
  #             #         ##          #          #     #   ##   #    ##      #             ##    #   ##   #   ##     #########      #     #        ########## 
   ######        #      ##            #           #         #      ##         #######    ##           #     ##                       #     #######                                                                                                                                                                          
NESTEDHANDBRAKE
"
$convertingText = @{ en = "Converting" ; de = "Konvertiere"; "ja-jp" = "を変換する。"}


$logo_int = "
███╗   ██╗███████╗███████╗████████╗███████╗██████╗ ██╗  ██╗ █████╗ ███╗   ██╗██████╗ ██████╗ ██████╗ ███████╗ █████╗ ██╗  ██╗
████╗  ██║██╔════╝██╔════╝╚══██╔══╝██╔════╝██╔══██╗██║  ██║██╔══██╗████╗  ██║██╔══██╗██╔══██╗██╔══██╗██╔════╝██╔══██╗██║ ██╔╝
██╔██╗ ██║█████╗  ███████╗   ██║   █████╗  ██║  ██║███████║███████║██╔██╗ ██║██║  ██║██████╔╝██████╔╝█████╗  ███████║█████╔╝ 
██║╚██╗██║██╔══╝  ╚════██║   ██║   ██╔══╝  ██║  ██║██╔══██║██╔══██║██║╚██╗██║██║  ██║██╔══██╗██╔══██╗██╔══╝  ██╔══██║██╔═██╗ 
██║ ╚████║███████╗███████║   ██║   ███████╗██████╔╝██║  ██║██║  ██║██║ ╚████║██████╔╝██████╔╝██║  ██║███████╗██║  ██║██║  ██╗
╚═╝  ╚═══╝╚══════╝╚══════╝   ╚═╝   ╚══════╝╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝     
"

$files = Get-ChildItem -Path $input -Include *$filetype -Recurse -File -Force -ErrorAction SilentlyContinue | where {! $_.PSIsContainer}
#Get-WinSystemLocale
echo ""
echo "---------------------------------------------------------------------------------------------"
switch($lang){
    "ja-jp"{echo $logo_jp}
    Default {echo $logo_int}
}
echo "NestedHandbrake (Nested Video Encoder, using HandBrakeCLI on Windows Systems via PowerShell)"
echo "(C) 2019 STVS Studios. This script is open Source as stated in the .LICENCE file"
echo "---------------------------------------------------------------------------------------------"
echo ""
foreach($file in $files) {
    $i = $file.BaseName
    $in = $file.FullName
    $des = $file.Directory.Name + '/'
    if($des.contains('Season') -or $des.contains('OVA') ){
        $des = $file.Directory.Parent.Name + '/' + $des
    }
    switch($lang){
        "ja-jp" {echo "$i を変換する。"}
        Default {echo "$convertingText.$dlang $i"}
    }
    if( -not (Test-Path $output$des -PathType Container) ){
#        mkdir "$output$des"
    }
#    .\HandBrakeCLI.exe -i "$in" -o "$output$des$i$extension" --preset="$preset" -O -s "scan" --audio-lang-list 'und' --all-audio --subtitle-lang-list 'Deutsch - [Deutsch]' --all-subtitles
    echo "Finished optimizing that video file"
}
echo "-------------------------------------------------"
echo "All $filetype files in this directory are now optimized"
echo "for streaming. Have a good day. :)"
echo "-------------------------------------------------"
