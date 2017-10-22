import XMonad hiding (Tall)
import XMonad.Hooks.DynamicLog
import XMonad.Util.EZConfig
import XMonad.Util.Run
import XMonad.Prompt
import XMonad.Layout.ThreeColumns
import XMonad.Layout.HintedTile
import XMonad.Layout.HintedGrid
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.LayoutHints
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import XMonad.Layout.NoBorders


myLayout = layoutHints $ avoidStruts $ ThreeColMid 1 delta ratio ||| ThreeColMid 2 delta ratio ||| hintedTile Tall ||| hintedTile Wide ||| noBorders Full ||| Grid False
	 where
		hintedTile = HintedTile nmaster delta ratio TopLeft
		nmaster = 1
		delta = 3/100
		ratio = 5/12

main = do 
     xmonad $ ewmh $ defaultConfig
     	    {
              manageHook = manageDocks <+> manageHook defaultConfig
            , handleEventHook = handleEventHook defaultConfig <+> fullscreenEventHook
	    , layoutHook = myLayout
	    , modMask = mod4Mask -- Super instead of Alt
	    } `additionalKeys`
	    [
	      ((mod4Mask 	 , xK_b	  ), sendMessage ToggleStruts)
	      , ((mod4Mask	 , xK_e	  ), spawn "exec emacsclient -a '' -c")
     	    ]	    
