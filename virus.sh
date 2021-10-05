#!/bin/bash
heslo="aaa"
chrootfolder="/home/secret"

checkpassword(){
  read -p 'Tajné heslo: ' pass
  if [ "$pass" == "$heslo" ]; then
    espeak -v czech "Gratuluji, heslo je správné." &
    echo "Správné heslo!"
    echo "Výtečně, zadali jste správné heslo. Končím." | pv -qL 10
    echo
    figlet -c "Výborně!"
    sleep 5
    mkdir -p $chrootfolder
    echo "Nastavuji chráněné prostředí..."
    echo "Rbinduju systémové adresáře do budoucího chrootu..."
    mkdir -p $chrootfolder/bin
    mkdir -p $chrootfolder/dev
    mkdir -p $chrootfolder/lib
    mkdir -p $chrootfolder/proc
    mkdir -p $chrootfolder/sbin
    mkdir -p $chrootfolder/sys
    mkdir -p $chrootfolder/usr
    mount --rbind /bin $chrootfolder/bin
    mount --rbind /dev $chrootfolder/dev
    mount --rbind /lib $chrootfolder/lib
    mount --rbind /proc $chrootfolder/proc
    mount --rbind /sbin $chrootfolder/sbin
    mount --rbind /sys $chrootfolder/sys
    mount --rbind /usr $chrootfolder/usr
    echo "Chrootuji..."
    chroot $chrootfolder
  else
    espeak -v czech "Špatné heslo!" &
    echo "Špatné heslo!"
    echo "Snažte se, nebo se naštvu! Moc pokusů už vám nezbývá!!!" | pv -qL 10
    checkpassword
  fi
}

app(){
  txt="Hahahahahaha, počítač byl právě zavirován. Jste pěkně v pytli, tento počítač pocítí středověk."
  espeak -v czech $txt &
  echo $txt | pv -qL 10
  sleep 5
  clear
  for i in {1..10}; do figlet -c "Jsem virus a tvuj pocitac ted zazije stredovek!!!"; sleep 0.5; done
  sleep 2
  figlet -f slant "Zadej tajné heslo! Jináč se mě nezbavíš."
  txt="Tohoto viru se jenom tak nezbavíte, budete muset najít tajné heslo a zadat ho sem, jinak se s tímto počítačem a obsahem flešky můžete rozloučit."
  espeak -v czech $txt &
  echo $txt | pv -qL 10
  sleep 3
  echo ""
  espeak -v czech "zadejte heslo a stiskněte enter" &
  echo "Zadejte heslo a stiskněte [Enter]" | pv -qL 10
  checkpassword
}

app

