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
