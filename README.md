##Prose
Ruby Gem to identifies languages from a string. Porse literally means, written or spoken language in its ordinary form, without metrical structure.

##Installation
<tt>gem install prose</tt>

##Require
<tt>require 'porse'</tt>

##Usage
	"אודם".porse? #will return ['hebrew']
	"ruby".prose? #will return ['latin']
	"אודם ruby".prose? #will return ['hebrew', 'latin']

##Source
http://unicode.org/charts/