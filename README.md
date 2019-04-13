# salt
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
Kirjoitin tähän asti tekstiä README.md tiedostoon ja kokelin ensimmäista committia GitHubiin komenoilla "**git config --global user.email "joni.hakala@myy.haaga-helia.fi"**" ja "**git config --global user.name "Joni Hakala"**", lisäsin config tiedostoon henkilö tiedot, josta Git saa tiedon keneltä commit tulee. Komennolla "** ASD **" lisäsin uuden commitin.
