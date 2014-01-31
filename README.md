##Prose
Ruby Gem to identifies languages from a string. Prose literally means, written or spoken language in its ordinary form, without metrical structure.

##Installation
<tt>gem install prose</tt>

##Require
<tt>require 'prose'</tt>

##Usage
	"אודם".prose?      #will return ['hebrew']
	"ruby".prose?      #will return ['latin']
	"हिन्दी".prose?  #will return ['devanagari']
	"אודם ruby".prose?  #will return ['hebrew', 'latin']

##Note
 Since we are dealing with unicode the gem dosent necessarily identifies the language all the time instead identifies the origin of the script. Example English alphabets belongs to Latin alphabet set. And Hindi letters belong to Devanagri.

##Source
http://unicode.org/charts/ 
