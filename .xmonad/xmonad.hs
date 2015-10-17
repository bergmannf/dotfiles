import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.EwmhDesktops
import XMonad.Layout.Fullscreen hiding (fullscreenEventHook)
import XMonad.Util.SpawnOnce(spawnOnce)
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Actions.CycleWS(swapNextScreen)
import System.IO


myWorkspaces = ["1:Web", "2:Dev", "3:Mus", "4:Vid", "5:Gam", "6:Read", "7", "8", "9"]
myTerminal = "gnome-terminal"
myNormalBorderColor = "#263238"
myFocusedBorderColor = "#82B1FF"

myStartUp :: X ()
myStartUp = do
  spawnOnce "nm-applet"
  spawnOnce "redshift -l 55:10"
  spawnOnce "xrandr --output 'DVI-1' --mode 1920x1080 --primary --output 'DVI-0' --mode 1280x1024 --left-of 'DVI-1'"

myManageHook = composeAll
               [ className =? "Firefox" --> doShift "1:Web"
               , className =? "Iceweasel" --> doShift "1:Web"
               , className =? "Emacs" --> doShift "2:Dev"
               , className =? "Cantata" --> doShift "3:Mus"
               , className =? "vlc" --> doShift "4:Vid"
               , className =? "Steam" --> doShift "5:Gam"
               , className =? "libprs500" --> doShift "6:Read"
               , isFullscreen --> doFullFloat
               ]

main :: IO ()
main                       = do
  xmproc <- spawnPipe "xmobar"
  xmonad $ ewmh defaultConfig
    { manageHook      = manageDocks <+> myManageHook <+> manageHook defaultConfig
    , layoutHook      = avoidStruts  $  layoutHook defaultConfig
    , handleEventHook = handleEventHook defaultConfig <+> fullscreenEventHook
    , startupHook     = myStartUp
    , modMask         = mod4Mask
    , workspaces      = myWorkspaces
    , terminal        = myTerminal
    , logHook         = dynamicLogWithPP xmobarPP
                             { ppOutput = hPutStrLn xmproc
                             , ppCurrent = xmobarColor "#C792EA" "" . wrap "[" "]"
                             , ppTitle  = xmobarColor myFocusedBorderColor "" . shorten 50
                             }
    , focusedBorderColor = myFocusedBorderColor
    , normalBorderColor  = myNormalBorderColor
    } `additionalKeys`
    [ ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command lock")
    , ((mod4Mask, xK_x), swapNextScreen)
    ]
