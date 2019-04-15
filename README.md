# Salt
# Linux palvelinten hallinta H3

Alotin avaamalla Xubuntu-18.04.2 LTS 64-bit Live tilaan. Tällä live koneella testaan Slave ja Master toimivuuden.

## Pöytäkoneen rauta
Otin selvää koneen raudasta komennolla "**sudo lshw -short -sanitize**", listasin vain ollennaisimmat tiedot.

	H/W path                    Device     Class       Description
	==============================================================
	system			    To Be Filled By O.E.M. (To Be
	/0                                     bus         B450 Pro4
	/0/0                                   memory      64KiB BIOS
	/0/e                                   memory      16GiB System Memory
	/0/e/0                                 memory      8GiB DIMM DDR4 Synchronous Un
	/0/e/2                                 memory      8GiB DIMM DDR4 Synchronous Un
	/0/10                                  memory      576KiB L1 cache
	/0/11                                  memory      3MiB L2 cache
	/0/12                                  memory      16MiB L3 cache
	/0/13                                  processor   AMD Ryzen 5 2600 Six-Core Pro
	/0/100/1.3/0.2/7/0          enp37s0    network     RTL8111/8168/8411 PCI Express
	/0/100/3.1/0                           display     GP107 [GeForce GTX 1050 Ti]
	/0/100/3.1/0.1                         multimedia  NVIDIA Corporation
	/0/1/0.0.0                  /dev/sda   disk        500GB WDC WDS500G1B0A-
	/0/2/0.0.0                  /dev/sdb   disk        250GB CT250MX500SSD4

## Alku asennukset Xubuntulle
Xubuntulle päivitin versio tiedot komennolla "**sudo apt-get update**" ja asensin Salt-master paketin komennolla "**sudo apt-get install salt-master**"

## Git:in kokeilu
Aloitin Git:in kokeilun tekemällä GitHub sivulle uuden repositoryn nimeltä "salt", lisäsin repositoryyn GNU-v3.0 lisenssin ja README.md tiedoston. Kopioin repositoryn paikkalliselle Xubuntulle navigoimalla kansiion /srv ja komennolla "**sudo git clone https://github.com/Dunttus/salt.git**" loin salt kansion.

Kirjoitin tähän asti tekstiä README.md tiedostoon ja kokelin ensimmäista committia GitHubiin komenoilla "**git config --global user.email "joni.hakala@myy.haaga-helia.fi"**" ja "**git config --global user.name "Joni Hakala"**", lisäsin config tiedostoon henkilö tiedot, josta Git saa tiedon keneltä commit tulee. Komennoilla "**sudo add . **", "**sudo commit -m "First test commit"**", "**sudo git pull; sudo git push**", lisäsin uudet tekstit Githubiin. Katsoin vielä menikö uusi commit GitHub sivulle, kyllä meni eli toimii.

## Git log, git diff ja git blame
Tein uuden kansion tulevalle ohjelmalle komennolla "**sudo mkdir sysstat**". Kansioon sysstat loin teksti tiedoston komennolla "**sudoedit init.sls**" ja uuden kansion komenolla "**sudo mkdir config**".
Lähetin uudet muutokset GitHubiin komennoilla "**sudo git add .; sudo git commit -m "Testing log, dif and blame"; sudo git pull; sudo git push**"

### Git log
Git log kokeilu ja analyysi, alotin komennolla "**git log**".

	xubuntu@xubuntu:/srv/salt/sysstat$ git log
	
	commit 10ed6679fb7d6b939a02afa30a640b516c2d9c7a (HEAD -> master, origin/master, origin/HEAD)
	Author: Joni Hakala <joni.hakala@myy.haaga-helia.fi>
	Date:   Sat Apr 13 11:05:37 2019 +0000
	
	    Testing log, dif and blame
	
	commit 785882587d50e51d0aaf0864763b272bac70e8ed
	Author: Joni Hakala <joni.hakala@myy.haaga-helia.fi>
	Date:   Sat Apr 13 10:35:16 2019 +0000
	
	    First test commit
	
	commit d9f13e508a7001253b1268a073dfa78ae5ea795e
	Author: Dunttus <36055735+Dunttus@users.noreply.github.com>
	Date:   Thu Apr 11 21:06:01 2019 +0300
	
	    Initial commit

Git log komennolla sain selville kaikkien muutosten lohkoketju numeron esim initial commit lohkonumero kohasta commit "d9f13e508a7001253b1268a073dfa78ae5ea795e", kaikkien muutosten tekijöiden nimet ja spostit Author: kohdasta "Dunttus <36055735+Dunttus@users.noreply.github.com>" ja muokkasten commit ajan kohdan Date: kohdasta "Thu Apr 11 21:06:01 2019 +0300" 

### Git diff
Git diff kokeilu ja analyysi, aloitin komennolla git "**git diff**".

	xubuntu@xubuntu:/srv/salt/sysstat$ git diff
	
	diff --git a/README.md b/README.md
	index 1bd7636..80fb4b0 100644
	--- a/README.md
	+++ b/README.md
	@@ -1,4 +1,4 @@
	-# salt
	+# Salt
	 # Linux palvelinten hallinta H3
	 
	 Alotin avaamalla Xubuntu-18.04.2 LTS 64-bit Live tilaan. Tällä live koneella testaan Slave ja Master toimivuuden.
	@@ -29,4 +29,9 @@ Xubuntulle päivitin versio tiedot komennolla "**sudo apt-get update**" ja asens
	 
	 ## Git:in kokeilu
	 Aloitin Git:in kokeilun tekemällä GitHub sivulle uuden repositoryn nimeltä "salt", lisäsin repositoryyn GNU-v3.0 lisenssin ja README.md tiedoston. Kopioin repositoryn paikkalliselle Xubuntulle navigoimalla kansiion /srv ja komennolla "**sudo git clone https://github.com/Dunttus/salt.git**" loin salt kansion.
	-Kirjoitin tähän asti tekstiä README.md tiedostoon ja kokelin ensimmäista committia GitHubiin komenoilla "**git config --global user.email "joni.hakala@myy.haaga-helia.fi"**" ja "**git config --global user.name "Joni Hakala"**", lisäsin config tiedostoon henkilö tiedot, josta Git saa tiedon keneltä commit tulee. Komennolla "** ASD **" lisäsin uuden commitin.
	+
	+Kirjoitin tähän asti tekstiä README.md tiedostoon ja kokelin ensimmäista committia GitHubiin komenoilla "**git config --global user.email "joni.hakala@myy.haaga-helia.fi"**" ja "**git config --global user.name "Joni Hakala"**", lisäsin config tiedostoon henkilö tiedot, josta Git saa tiedon keneltä commit tulee. Komennoilla "**sudo add . **", "**sudo commit -m "First test commit"**", "**sudo git pull; sudo git push**", lisäsin uudet tekstit Githubiin. Katsoin vielä menikö uusi commit GitHub sivulle, kyllä meni eli toimii.
	+
	+## git log, git diff ja git blame
	+Tein uuden kansion tulevalle ohjelmalle komennolla "**sudo mkdir sysstat**". Kansioon sysstat loin teksti tiedoston komennolla "**sudoedit init.sls**" ja uuden kansion komenolla "**sudo mkdir config**".
	+Lähetin uudet muutokset GitHubiin komennoilla "**sudo git add .; sudo git commit -m "Testing log, dif and blame"; sudo git pull; sudo git push**"

Git diff komennolla sain selville mitä tiedostoissa on vaihdettu + ja - merkkeillä esim. Teksti tiedosto README.md:n sisällä vaihdoin tekstejä "-# salt" ja "+# Salt" eli vahdtoin tekstin salt isolla alkukirjaimella --> Salt.

### Git blame
Git blame kokeilu ja analyysi, aloitin komennolla "**git blame init.sls**".

	xubuntu@xubuntu:/srv/salt/sysstat$ git blame init.sls
	
	10ed6679 (Joni Hakala 2019-04-13 11:05:37 +0000 1) HelloWorld!

Git blame komennolla saadaan selville muutoksen tekijän nimi ja muutoksen ajankohta "(Joni Hakala 2019-04-13 11:05:37 +0000 1) HelloWorld!".

## Git huonon muutoksen poisto
Poistin tämän teksti tiedoston Xubuntulta kansiosta /srv/salt komennolla "sudo rm README.md" ja komennolla "**sudo reset --hard**" toin tiedoston takaisin Salt kansioon.

	xubuntu@xubuntu:/srv/salt$ sudo rm README.md
	xubuntu@xubuntu:/srv/salt$ ls
	LICENSE  sysstat
	xubuntu@xubuntu:/srv/salt$ sudo git reset --hard
	HEAD is now at 1b42327 Updating README.md
	xubuntu@xubuntu:/srv/salt$ ls
	LICENSE  README.md  sysstat
 
## Salt
Ensin hain versio tiedot Xubuntulle komennolla "**sudo apt-get update**" ja asensin samalle koneelle Salt Minionin ja Masterin komennolla "**sudo apt-get install salt-master salt-minion**".
Otin koneen orjaksi kansiosta /etc/salt/ tiedostoon minion kirjoitamalla sudoeditillä rivit 
	master: 192.168.10.62
	id: userjoni
IP osoitteen sain selville komennolla "**hostname -I**". Uudelleen käynnistin vielä Salt-Minionin komennolla "**sudo systemctl restart salt-minion**".
Otin vastaan orja tietokoneen komennolla "**sudo salt-key -A**"

	xubuntu@xubuntu:/etc/salt$ sudo salt-key -A
	The following keys are going to be accepted:
	Unaccepted Keys:
	userjoni
	Proceed? [n/Y] Y
	Key for minion userjoni accepted.

Kokeilin vielä Master Minion arkkitehtuurin toimivuuden komennolla "**sudo salt '*' cmd.run 'whoami'**".

	xubuntu@xubuntu:/etc/salt$ sudo salt '*' cmd.run 'whoami'
	userjoni:
	    root

Komento vastasi oletetusti eli yhteys toimii.

## Sysstat asennus Salt moduuli
Loin sysstat kansion, init.sls tiedoston ja config kansion tehtävässä "Git log, git diff ka git blame" eli kansio rakenne komennolla "**tree**".

	xubuntu@xubuntu:/srv/salt/sysstat$ tree
	.
	├── config
	└── init.sls
	
	1 directory, 1 file

### Init.sls tiedosto paketti asennus
Ensin tarvitaan Salt moduuliin sysstat asennus paketti eli tein sen seuraavasti init.sls tiedostoon.

	install_sysstat:
	  pkg.installed:
	    - pkgs:
	      - sysstat

Kokeilin toimivuuden ensin komennolla "**sar**", joka vastasi: 

	xubuntu@xubuntu:/etc/salt$ sar
	
	Command 'sar' not found, but can be installed with:
	
	sudo apt install sysstat

Eli sysstat ei ollu vielä asennettu Masterilla komennolla "**sudo salt '*' state.apply sysstat**" suoritin tiedostoon init.sls kirjoittamani rivit orja koneelle eli sysstatin pitäisi asentua.

	xubuntu@xubuntu:/srv/salt/sysstat$ sudo salt '*' state.apply sysstat
	userjoni:
	----------
	          ID: install_sysstat
	    Function: pkg.installed
	      Result: True
	     Comment: The following packages were installed/updated: sysstat
	     Started: 16:01:45.626395
	    Duration: 9317.832 ms
	     Changes:   
	              ----------
	              sysstat:
	                  ----------
	                  new:
	                      11.6.1-1
	                  old:
	
	Summary for userjoni
	------------
	Succeeded: 1 (changed=1)
	Failed:    0
	------------
	Total states run:     1
	Total run time:   9.318 s
 
Saltin loki kertoi asentaneensa systat ohjelmiston, joten kokeilin orjalla komentoa "**sar**".

	xubuntu@xubuntu:/etc/salt$ sar
	Cannot open /var/log/sysstat/sa15: No such file or directory
	Please check if data collecting is enabled

Nyt sar komento ilmoitti että pitää laittaa data collection päälle eli sysstat paketti on asentunut ja tarvitsee vielä asetus tiedoston toimiakseen.

## Init.sls asetus tiedosto sysstatiin

