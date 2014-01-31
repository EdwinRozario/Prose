import 'yaml'

class String

  def identify

  end

  private

  def unicode_ranges
  	@ranges ||= YAML::load( File.open( "#{File.expand_path File.dirname(__FILE__)}/languages.yaml" ) )
  end

end

=> "മ" 
2.0.0-p353 :011 > x[0].ord
 => 3374 
2.0.0-p353 :012 > (x[0].ord).to_s(16)
 => "d2e" 
2.0.0-p353 :013 > ['d2e'.scan(/[0-9a-f]{2}/i).reverse.join].pack('H*').unpack('l')
 => [nil] 
2.0.0-p353 :014 > ['fb6d8cf1'.scan(/[0-9a-f]{2}/i).reverse.join].pack('H*').unpack('l')
 => [-76706575] 
2.0.0-p353 :015 > 

2.0.0-p353 :015 > ['d2e'.scan(/[0-9a-f]{2}/i).reverse.join].pack('H*').unpack('l')
 => [nil] 
2.0.0-p353 :016 > (x[0].ord).to_s(16)
 => "d2e" 
2.0.0-p353 :017 > x[0].ord
 => 3374 
2.0.0-p353 :018 > 'd2e'.to_i(16).to_s(2)
 => "110100101110" 
2.0.0-p353 :019 > 'd2e'.to_i(16).to_s(10)
 => "3374" 
2.0.0-p353 :020 > '0D00'.to_i(16).to_s(2)
 => "110100000000" 
2.0.0-p353 :021 > '0D00'.to_i(16).to_s(10)
 => "3328" 
2.0.0-p353 :022 > '0D7F'.to_i(16).to_s(10)
 => "3455" 
2.0.0-p353 :023 > '0D7F'.to_i(16).to_s(10) - '0D00'.to_i(16).to_s(10)
NoMethodError: undefined method `-' for "3455":String
	from (irb):23
	from /home/edwin/.rvm/rubies/ruby-2.0.0-p353/bin/irb:12:in `<main>'
2.0.0-p353 :024 > '0D7F'.to_i(16).to_s(10).to_i - '0D00'.to_i(16).to_s(10).to_i
 => 127 
2.0.0-p353 :025 > def malayalam
2.0.0-p353 :026?>   end
 => nil 
2.0.0-p353 :027 > def malayalam(x)
2.0.0-p353 :028?>   return if x.ord > 3328 and x.ord < 3455
2.0.0-p353 :029?>   end
 => nil 
2.0.0-p353 :030 > malayalam("ല")
 => nil 
2.0.0-p353 :031 > malayalam("ല")
 => nil 
2.0.0-p353 :032 > "ല".ord
 => 3378 
2.0.0-p353 :033 > def malayalam1(x)
2.0.0-p353 :034?>   return if x.ord > 3328 and x.ord < 3455
2.0.0-p353 :035?>   end
 => nil 
2.0.0-p353 :036 > malayalam1("ല")
 => nil 
2.0.0-p353 :037 > def mal(x)
2.0.0-p353 :038?>   (x.ord > 3328 and x.ord < 3455)
2.0.0-p353 :039?>   end
 => nil 
2.0.0-p353 :040 > mal("ല")
 => true 
2.0.0-p353 :041 > mal("മലയാളം")
 => true 
2.0.0-p353 :042 > mal("")
ArgumentError: empty string
	from (irb):38:in `ord'
	from (irb):38:in `mal'
	from (irb):42
	from /home/edwin/.rvm/rubies/ruby-2.0.0-p353/bin/irb:12:in `<main>'
2.0.0-p353 :043 > mal("ം")
 => true 
2.0.0-p353 :044 > mal("യ")
 => true 
2.0.0-p353 :045 > mal("म")
 => false 
2.0.0-p353 :046 > mal("A")
 => false 
2.0.0-p353 :047 > mal("a")
 => false 
2.0.0-p353 :048 > 
