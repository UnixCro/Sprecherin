#Text, der einfach zu sagen ist
try
repeat 100 times
	set Fenster to display dialog "Hier den zu sprechenden Text eingeben" buttons {"ABBRECHEN", "BESTÄTIGEN"} default button 2 default answer "" with title "Sprecherin Anna"
	set Texteingabe to text returned of Fenster
	set Buttoneingabe to button returned of Fenster
	if Buttoneingabe = "ABBRECHEN" then
		exit repeat
	else
		set ShellScript to do shell script "/usr/bin/perl -Ue '$< = $>; system(@ARGV)' say -o /tmp/sprecherin.aiff " & Texteingabe & "&& /usr/bin/afplay -v 2 /tmp/sprecherin.aiff"
		
	end if
end repeat
end try
