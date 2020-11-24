English Version

##Tool introduction:
A Perl tool used to detect [Flash Vulnerability Library](http://web.appsec.ws/FlashExploitDatabase.php), and supports simple flash xss detection

##Operating environment:
OSX/Linux

##Precautions:
Since the tool uses flare06doswin, you need to install wine before it can run.


##Instructions:
   
		perl FlashScanner.pl 
		-g Google search sentence
		  -p start page number of search results
     	 -u Specify Flash URL
         -f local swf file path
          -h help information

		Example: perl FlashScanner.pl -g "site:test.com filetype:swfinurl:player" -p 1

##Run screenshot
![](http://security.tencent.com/uploadimg_dir/201311/1159ecd6bbc1b6c40a58d7f394ec4005.png)
