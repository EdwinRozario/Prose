##Prose
Ruby Gem to identifies languages from a string. Porse literally means, written or spoken language in its ordinary form, without metrical structure. Since we are dealing with unicode the gem dosent necessarily identifies the language all the time instead identifies the origin of the script. Example english alphabets belongs to latin alphabet set.

##Installation
<tt>gem install prose</tt>

##Require
<tt>require 'porse'</tt>

##Usage
	"אודם".porse?      #will return ['hebrew']
	"ruby".prose?      #will return ['latin']
	"हिन्दी".prose?  #will return ['devanagari']
	"אודם ruby".prose?  #will return ['hebrew', 'latin']

##Source
http://unicode.org/charts/ 
