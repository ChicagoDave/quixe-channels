Version 1/042015 of Quixe Channels Scoring (for Glulx only) by David Cornelson begins here.

Section 1
[
  Create a new channel for score related output messages...
]

Include (- Constant FYC_SCORE_MESSAGE = ('S' * $1000000) + ('C' * $10000) + ('R' * $100) + 'M'; -);

Section 2a - Not For Release

To Select the Score Message Channel:
	(- if (is_fyrevm) FyreCall(FY_CHANNEL, FYC_SCORE_MESSAGE); else print "** Score Message channel ON **^";  -);

Section 2b - For Release Only

To Select the Score Message Channel:
	(- if (is_fyrevm) FyreCall(FY_CHANNEL, FYC_SCORE_MESSAGE); -);

Section 3

[
  Turn scoring on...
]

Use scoring;

Quixe Channels Scoring ends here.
