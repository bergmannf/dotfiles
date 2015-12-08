import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.EwmhDesktops
import XMonad.Layout.Fullscreen hiding (fullscreenEventHook)
import XMonad.Layout.NoBorders
import qualified XMonad.StackSet as W
import XMonad.Util.SpawnOnce(spawnOnce)
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Actions.CycleWS(swapNextScreen)
import System.IO


myWorkspaces = ["1:Web", "2:Dev", "3:Mus", "4:Vid", "5:Gam", "6:Read", "7", "8", "9"]
myTerminal = "xfce4-terminal"
myNormalBorderColor = "#263238"
myFocusedBorderColor = "#82B1FF"

myStartUp :: X ()
myStartUp = do
  spawnOnce "nm-applet"
  spawnOnce "redshift -l 55:10"
  spawnOnce "xrandr --output 'DVI-1' --mode 1920x1080 --primary --output 'DVI-0' --mode 1280x1024 --left-of 'DVI-1'"
  spawnOnce "xmodmap ~/.Xmodmap"
  spawnOnce "trayer --edge top --align right --SetDockType true --SetPartialStrut true --widthtype request --transparent true --tint 0x232A2F --height 16 --monitor 1"

myManageHook = composeAll
               [ className =? "Firefox" --> doShift "1:Web"
               , className =? "Iceweasel" --> doShift "1:Web"
               , className =? "google-chrome" --> doShift "1:Web"
               , className =? "Emacs" --> doShift "2:Dev"
               , className =? "Cantata" --> doShift "3:Mus"
               , className =? "vlc" --> doShift "4:Vid"
               , className =? "Steam" --> doShift "5:Gam"
               , className =? "libprs500" --> doShift "6:Read"
               , isFullscreen --> doFullFloat
               , fullscreenManageHook
               ]

myLayouts = avoidStruts (Tall 1 (3/100) (1/2)
                        ||| Mirror (Tall 1 (3/100) (1/2))
                        ||| Full)
            ||| noBorders (fullscreenFull Full)

nonGreedyViews = [((m .|. mod4Mask, k), windows $ f i) -- Replace 'mod1Mask' with your mod key of choice.
                      | (i, k) <- zip myWorkspaces [xK_1 .. xK_9],
                  (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]

main :: IO ()
main                       = do
  xmproc        <- spawnPipe "xmobar -x 0"
  xmproc_second <- spawnPipe "xmobar -x 1"
  xmonad $ ewmh defaultConfig
    { manageHook      = manageDocks <+> myManageHook <+> manageHook defaultConfig
    , layoutHook      = myLayouts
    , handleEventHook = handleEventHook defaultConfig <+> fullscreenEventHook
    , startupHook     = myStartUp
    , modMask         = mod4Mask
    , workspaces      = myWorkspaces
    , terminal        = myTerminal
    , logHook         = dynamicLogWithPP xmobarPP
                             { ppOutput = \x -> mapM_ (`hPutStrLn` x) [xmproc, xmproc_second]
                             , ppCurrent = xmobarColor "#C792EA" "" . wrap "[" "]"
                             , ppTitle  = xmobarColor myFocusedBorderColor "" . shorten 50
                             }
    , focusedBorderColor = myFocusedBorderColor
    , normalBorderColor  = myNormalBorderColor
    } `additionalKeys`
    ([ ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command lock")
    , ((mod4Mask, xK_x), swapNextScreen)
    ] ++ nonGreedyViews)
