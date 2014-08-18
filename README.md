##Prose
Ruby Gem to identifies languages from a string. Prose literally means, written or spoken language in its ordinary form, without metrical structure.

##Installation
<tt>gem install prose</tt>

##Require
<tt>require 'prose'</tt>

##Usage
	"אודם".prose     # will return ['hebrew']
	"Ruby".prose     # will return ['latin']
	"हिन्दी".prose     # will return ['devanagari']
	"אודם ruby".prose  # will return ['hebrew', 'latin']

	"لعربية".arabic?  # will return true. This will work only for languages identified by Prose
	"Peace".latin?  # will return true. But .english? will return an error

	"אודם لعربية".hebrew? #will return true, since the string contains Hebrew.
	"אודם لعربية".hebrew?(pure = true) # will return false, since the string contains Arabic too. 
	                                #This will return ture only when the string is pure Hebrew.


##Note
 Since we are dealing with unicode the gem dosent necessarily identifies the language all the time instead identifies the origin of the script. Example English alphabets belongs to Latin alphabet set. And Hindi letters belong to Devanagri. Havent included CJK yet.

##Source
http://unicode.org/charts/