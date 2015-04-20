Version 1/041915 of Quixe Channels Story Info by David Cornelson begins here.

[
  This extension is for Quixe Channels stories.
  
  It adds a new channel, "gameinfo" and every turn sends the details in a JSON object.
]

Section 1 - Definitions

Include (- Constant FYC_GAMEINFO = ('I' * $1000000) + ('N' * $10000) + ('F' * $100) + 'O'; -);

To say story serial number: (- PrintSerialNumber(); -).

Include (-
[ PrintSerialNumber i;
	for (i=0 : i<6 : i++) print (char) ROM_GAMESERIAL->i;
];
-).

To say I7 version number: (- print (PrintI6Text) NI_BUILD_COUNT; -).
To say I6 version number: (- print inversion; -);
To say I7 library number: (- print (PrintI6Text) LibRelease; -);
To say I6 library number: (- inversion; -);
To say strict mode: (- CheckStrictMode(); -);

Include (-
[ CheckStrictMode;
	#Ifdef STRICT_MODE;
	print "S";
	#Endif; ! STRICT_MODE;
];
-).

To say debug mode: (- CheckDebugMode(); -);

Include (-
[ CheckDebugMode;
	#Ifdef DEBUG;
	print "D";
	#Endif; ! DEBUG;
];
-).

Section 2a - Not For Release

To Select the Game Info Channel:
	(- if (is_fyrevm) FyreCall(FY_CHANNEL, FYC_GAMEINFO); else print "** Game Info channel ON **^";  -);

Section 2b - For Release Only

To Select the Game Info Channel:
	(- if (is_fyrevm) FyreCall(FY_CHANNEL, FYC_GAMEINFO); -);

Section 3b - Print the game info

Every turn when outputting channels (this is the add banner channel rule):
	select the banner channel;
	say "{ storyTitle: [quotation mark][story title][quotation mark], storyHeadline: [quotation mark][story headline][quotation mark], storyAuthor: [quotation mark][story author][quotation mark], storyCreationYear: [quotation mark][story creation year][quotation mark], releaseNumber: [quotation mark][release number][quotation mark], serialNumber: [quotation mark][story serial number][quotation mark], inform7Build: [quotation mark][I7 version number][quotation mark], inform6Library: [quotation mark][I6 library number][quotation mark], inform7Library: [quotation mark][I7 library number][quotation mark], strictMode: [quotation mark][strict mode][quotation mark], debugMode: [quotation mark][debug mode][quotation mark] }";
	select the main channel.
	
Quixe Channels Story Info ends here.
