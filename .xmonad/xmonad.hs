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


myWorkspaces = ["Web", "Dev", "Mus", "Gam", "Read", "6", "7", "8", "9"]
myTerminal = "gnome-terminal"

myStartUp :: X ()
myStartUp = do
  spawnOnce "nm-applet"
  spawnOnce "redshift -l 55:10"
  spawnOnce "xrandr --output 'DVI-1' --mode 1920x1080 --primary --output 'DVI-0' --mode 1280x1024 --left-of 'DVI-1'"

myManageHook = composeAll
               [ isFullscreen --> doFullFloat
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
                             , ppTitle  = xmobarColor "green" "" . shorten 50
                             }
    } `additionalKeys`
    [ ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command lock")
    , ((mod4Mask, xK_x), swapNextScreen)
    ]
