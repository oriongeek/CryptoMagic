#!/usr/bin/env ruby

#************************************************
#AUTHOR : ORIONGEEKS		         	|
#CYBERATTACK : FACEBOOK.COM/groups/CYB3RATT4CK  |
#SIMPLE ENCCRYPTION BASE64+REVERSE       	|
#REQUIRES : 2 GEMS GREEN_SHOES, BASE64	        |
#************************************************


require 'green_shoes'
require 'base64'

Shoes.app title:"Crypto maGIC BY ORION GEEKS" ,:width=>500, :height=>300 do 
background "#001".."#FF9"

title "CryptoMagic" ,align:'center' , stroke:red
subtitle "Because Privacy Matters", align:'center' , underline:'single'


stack{
@folder=button "Select the Folder" }
@folder.click {@note=ask_open_folder;@loc.replace @note}
#loc contains folder location
@loc=para @note 

stack :width=>'100%' do
        
@enc=button "Encrypt Files" , width:'100%'
@enc.click {encrypt;alert "Done"}

@dec=button "Decrypt Files", width:'100%'
@dec.click {decrypt;alert "Done"}

end
para "Regards OrionGeeks", align:'right' , stroke:green
para link("Join CyberAttack",:click=>"https://www.facebook.com/groups/cyb3ratt4ck") , align:'right'

#IF nothing set

def encrypt
@loc.replace ""
if !@note 
@note="No Folder Selected"
alert @note
else
@note+='/**/*'
#ALL THE SELECTED FILES OF FOLDER
files=Dir.glob(@note)
files.each do |x|
        encname=x+".En@CA"
begin
    if x.match('.En@CA')
        next
    else
    orig=File.read(x)
        fh=File.open(x,"w")
        fh.write(Base64.encode64(orig).reverse)
        fh.close
        File.rename(x,encname)
    end
    rescue
        next

end
end
end
end



def decrypt
        @loc.replace ""
if !@note
        alert "No Folder Selected"
else
@note+='/**/*'
files=Dir.glob(@note)
files.each do |x|
    encname=x.chomp('.En@CA')
    begin
    if x.match('.En@CA')
    enc=File.read(x).reverse
    fh=File.open(x,"w")
    fh.write(Base64.decode64(enc))
    fh.close
    File.rename(x,encname)
else
    next
    end
rescue
    next
    end
end
end
end

end