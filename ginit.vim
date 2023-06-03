" Enable Mouse
set mouse=a

" Set Editor Font
" if exists(':GuiFont')
"     GuiFont Plemol JP ConsoleNF:h10
" endif

" Disable GUI Tabline
if exists(':GuiTabline')
    GuiTabline 0
endif

" Disable GUi Popupmenu
if exists('GuiPopupmenu')
    GuiPopupmenu 0
endif

" Disable GUI ScrollBar
if exists(':GuiScrollBar')
    GuiScrollBar 0
endif
