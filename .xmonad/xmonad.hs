-- ~/.xmonad/xmonad.hs
-- Imports {{{
import XMonad
-- Prompt
import XMonad.Prompt
import XMonad.Prompt.RunOrRaise (runOrRaisePrompt)
import XMonad.Prompt.AppendFile (appendFilePrompt)
-- Hooks
import XMonad.Operations
 
import System.IO
import System.Exit
 
import XMonad.Util.Run
import XMonad.Util.EZConfig
 
import XMonad.Actions.CycleWS
 
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.SetWMName
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.UrgencyHook
import XMonad.Hooks.FadeInactive
import XMonad.Hooks.EwmhDesktops
 
import XMonad.Layout.NoBorders (smartBorders, noBorders)
import XMonad.Layout.PerWorkspace (onWorkspace, onWorkspaces)
import XMonad.Layout.Reflect (reflectHoriz)
import XMonad.Layout.IM
import XMonad.Layout.SimpleFloat
import XMonad.Layout.Spacing
import XMonad.Layout.ResizableTile
import XMonad.Layout.LayoutHints
import XMonad.Layout.LayoutModifier
import XMonad.Layout.Grid
 
import Data.Ratio ((%))

import XMonad.Config.Gnome
 
import qualified XMonad.StackSet as W
import qualified Data.Map as M

main = do
    dzenLeftBar <- spawnPipe myXmonadBar
    conqyBar <- spawnPipe conqyBarSetup
    trayer <- spawnPipe trayer
    xmonad $ withUrgencyHook NoUrgencyHook $ gnomeConfig
        { borderWidth = myBorderWidth
        , normalBorderColor = myBorderColor
        , focusedBorderColor = myFocusedBorderColor
        , terminal = myTerminal
        , manageHook = myManageHook <+> manageHook defaultConfig
        , layoutHook = avoidStruts $ myLayoutHook
        , logHook = myLogHook dzenLeftBar >> fadeInactiveLogHook 0xdddddddd
        , workspaces = myWorkspaces
        }
        `additionalKeys`
        [ ((mod1Mask, xK_p), spawn "dmenu_run -nb '#3f3f3f' -nf '#dcdccc' -sb '#dcdccc' -sf '#3f3f3f'")]

-- Constants
myBorderWidth = 2
myBorderColor = "#e9b96e"
myFocusedBorderColor = "#f57900"
myBitmapDir = "/home/florian/.dzen/icons"
myTerminal = "urxvt"
myWorkspaces = ["1:main", "2:web", "3:dev", "4:chat", "5:music", "6:graphics"]
myFont = "-*-terminus-medium-*-*-*-12-120-75-75-*-*-iso8859-*"
conqyBarSetup = "/home/florian/.xmonad/dzen.sh '" ++ dzenForeGround ++ "' '" ++ dzenBackGround ++ "' '" ++ myFont ++ "'"
myXmonadBar = "dzen2 -x '0' -y '0' -h '20' -ta 'l' -fg '" ++ dzenForeGround ++ "' -bg '" ++ dzenBackGround ++ "' -xs 1 -fn '" ++ myFont ++ "'"
trayer = "trayer --height 20 --widthtype request --edge bottom --expand true --align left --transparent true --alpha 0 --tint 0x000000"
-- myConqyBar = "conky -c ~/.dzen/.dzen_conky | dzen2 -y '0' -h '20' -ta 'r' -fg '" ++ dzenForeGround ++ "' -bg '" ++ dzenBackGround ++ "' -xs 2 -fn '" ++ myFont ++ "'"


--Colors
dzenForeGround = "#FFFFFF"
dzenFocusColor = "#f57900"
dzenNonFocusColor = "#e9b96e"
dzenBackGround = "#000000"
dzenUnknownColor = "#babdb6"
dzenUrgentColor = "#cc0000"

myManageHook = composeAll . concat $
    [ [resource     =?  r --> doIgnore             | r <- myIgnore ]
    , [className    =?  c --> doShift "2:web"      | c <- myWebs ]
    , [className    =?  c --> doShift "3:dev"      | c <- myDev ]
    , [className    =?  c --> doShift "4:chat"     | c <- myChat ]
    , [className    =?  c --> doShift "5:music"    | c <- myMusic ]
    , [className    =?  c --> doShift "6:graphics" | c <- myGraphics ]
    , [isFullscreen --> myDoFullFloat ]
    , [manageDocks ]
    ]
    where
        role = stringProperty "WM_WINDOW_ROLE"
        name = stringProperty "WM_NAME"

        -- Classnames
        myGraphics = ["gimp", "Mypaint"]
        myMusic = ["Clementine"]
        myChat = ["Pidgin", "Skype"]
        myWebs = ["Chromium-browser", "Opera"]
        myDev = ["Gnome-terminal", "Gvim", "Monodevelop"]

        -- Ignore windows
        myIgnore = ["desktop", "desktop_window", "notify-osd", "trayer"]

        myDoFullFloat :: ManageHook
        myDoFullFloat = doF W.focusDown <+> doFullFloat

myLogHook h = dynamicLogWithPP $ dzenPP
    {
          ppCurrent = dzenColor dzenFocusColor dzenBackGround . pad
        , ppVisible = dzenColor dzenNonFocusColor dzenBackGround . pad
        , ppHidden = dzenColor dzenForeGround dzenBackGround . pad
        , ppHiddenNoWindows = dzenColor dzenUnknownColor dzenBackGround . pad
        , ppUrgent = dzenColor dzenUrgentColor dzenBackGround . dzenStrip . pad 
        , ppSep = " | "
        , ppLayout = dzenColor dzenFocusColor dzenBackGround .
            (\x -> case x of
                "ResizableTall"     ->  "^i(" ++ myBitmapDir ++ "/tall.xbm)"
                "Mirror ResizableTall"  ->  "^i(" ++ myBitmapDir ++ "/mtall.xbm)"
                "Full"  -> "^i(" ++ myBitmapDir ++ "/full.xbm)"
                "Simple Float"  -> "-"
                _   -> x
            )
        , ppTitle = (" " ++) . dzenColor dzenForeGround dzenBackGround . dzenEscape
        , ppOutput = hPutStrLn h
    }

myLayoutHook =  onWorkspaces ["1:main", "5:music"] customLayout $
                onWorkspaces ["6:gimp"] gimpLayout $
                onWorkspaces ["4:chat"] imLayout $
                customLayout2

customLayout = avoidStruts $ tiled ||| Mirror tiled ||| Full ||| simpleFloat
    where
        tiled = ResizableTall 1 (2/100) (1/2) []

customLayout2 = avoidStruts $ Full ||| tiled ||| Mirror tiled ||| simpleFloat
    where
        tiled   = ResizableTall 1 (2/100) (1/2) []
 
gimpLayout  = avoidStruts $ withIM (0.11) (Role "gimp-toolbox") $
              reflectHoriz $
              withIM (0.15) (Role "gimp-dock") Full
 
imLayout    = avoidStruts $ withIM (1%5) (And (ClassName "Pidgin") (Role "buddy_list")) Grid 
