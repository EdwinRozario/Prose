##Prose
Ruby Gem to identifies languages from a string. Porse literally means, written or spoken language in its ordinary form, without metrical structure.

##Installation
<tt>gem install prose</tt>

##Require
<tt>require 'yasha'</tt>

##Usage
	"אודם".porse? #will return ['hebrew']
	"ruby".prose? #will return ['latin']
	"माणिक".prose? #will return ['hindi']
	"אודם ruby माणिक".prose? #will return ['hebrew', 'latin', 'hindi']

##Source
http://unicode.org/charts/