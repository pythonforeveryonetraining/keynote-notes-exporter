tell application "Keynote"
	activate
	set inputPath to POSIX path of (choose file with prompt "Choose keynote file to export presenter notes")
	open inputPath
	set outputPath to "'" & inputPath & ".txt" & "'"
	tell front document
		do shell script "rm -f " & outputPath
		repeat with s in every slide
			set notes to presenter notes of s as text
			set wordCount to count words of (notes)
			if wordCount > 0 then
				do shell script "echo '' >> " & outputPath
				do shell script "echo '" & notes & "' >> " & outputPath
			end if
		end repeat
	end tell
	quit application "Keynote"
end tell
