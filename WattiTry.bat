@echo off
GOTO Agreement
:Agreement
echo.
echo.
echo.
type agree.txt | more
echo.
echo.
echo.
GOTO Agree2
:Agree2
cls
echo Enter Y if you agree.
echo Enter N if you do not.
set agreem=""
set /p agreem="Enter your choice: " %=%
IF "%agreem%" == "Y" GOTO Menu
IF "%agreem%" == "N" GOTO Quit
IF "%agreem%" == "y" GOTO Menu
IF "%agreem%" == "n" GOTO Quit
goto Agree2
:Menu
cls
echo Options:
echo.
echo Enter G to Get a user's current status for a user's ID.
echo Enter C to get cast list from a story ID.
echo Enter S to search for a story.
echo Enter V to view comments for a story from a story ID.
echo.
echo Enter T to view a story from a story ID. 
echo [Experimental - Not Supported by the Wattpad API].
echo.
echo Enter Q to quit.
set label=""
set /p label="Enter your choice: " %=%
IF "%label%" == "G" GOTO GetUserStatus
IF "%label%" == "C" GOTO GetCast
IF "%label%" == "S" GOTO Search
IF "%label%" == "V" GOTO ViewComment
IF "%label%" == "T" GOTO ViewStory
IF "%label%" == "Q" GOTO Quit
IF "%label%" == "g" GOTO GetUserStatus
IF "%label%" == "c" GOTO GetCast
IF "%label%" == "s" GOTO Search
IF "%label%" == "v" GOTO ViewComment
IF "%label%" == "t" GOTO ViewStory
IF "%label%" == "q" GOTO Quit
GOTO BadArg

:GetUserStatus
cls
set string=""
set /p string="Enter Wattpad User ID: " %=%
wget -q http://wattpad.com/apiv2/userstatus?id=%string% -O userstatus.txt
echo.
echo.
echo.
type userstatus.txt
echo y | del userstatus.txt
echo.
echo.
echo.
pause
GOTO Menu
:GetCast
cls
set storyid=""
set /p %storyid%="Enter Wattpad Story ID: " %=%
wget -q http://wattpad.com/apiv2/getcast?id=%storyid% -O storycast.txt
echo.
echo.
echo.
type storycast.txt
echo y | del storycast.txt
echo.
echo.
echo.
pause
GOTO Menu
:Search
cls
set searchstring=""
set /p %searchstring%="Search: " %=%
wget -q http://wattpad.com/apiv2/storylist?search=%searchstring% -O searchresult.txt
echo.
echo.
echo.
type searchresult.txt
echo y | del searchresult.txt
echo.
echo.
echo.
pause
GOTO Menu
:ViewComment
cls
set storyid=""
set /p %storyid%="Enter the Story ID Number: " %=%
wget -q http://wattpad.com/apiv2/comments?id=%storyid% -O storycomments.txt
echo.
echo.
echo.
type storycomments.txt
echo y | del storycomments.txt
echo.
echo.
echo.
pause
GOTO Menu
:ViewStory
cls
echo This is highly experimental!
echo.
echo This may work one day, and not the next. It's an alpha-stage product.
echo.
set storyid=""
set /p %storyid%="Enter the Story ID Number: " %=%
wget -q touch.wattpad.com/%storyid% -O storytext.html
cat storytext.html | sed -e "s/<[^>]*>//g" storytext.html
echo.
echo.
echo.
echo y | del storytext.html
echo.
echo.
echo.
pause
GOTO Menu
:BadArg
echo Huh? What did you mean?
goto Menu
:Quit