# homer-virus
shellový skript, co při zasunutí flashky do USB vypne X server a v konzoli si hraje na virus, který požaduje heslo. Po zadání hesla se nastartuje X znovu s odlehčeným prostředím a moutne se ta flashka.
## jak to zprovoznit?
* Nainstalujeme závislosti: `figlet, espeak, pv`
* Aby se spustil skript po vložení flashky, tak tady máme systemd službu `homer-virus.service`. Musíme si ji však před povolením upravit podle svých potřeb:
    * Najdeme si naši jednotku: `systemctl list-units -t mount` a vložíme ji všude, kde je `media-YourMediaLabel.mount`
    * Dále je potřeba upravit ExecStart podle toho, kde máte tento projekt uložený. Doporučuji udělat složku skrytou.
* Zkopírujeme službu do `/etc/systemd/system`
* Službu můžeme spustit a aktivovat pomocí: `sudo systemctl start homer-virus.service` a `sudo systemctl enable homer-virus.service`
* Ve `virus.sh` nastavte proměné `heslo` a `chrootfolder` podle svých potřeb. `chrootfolder` obsahuje adresář, do kterého se nabindují systémové složky a následně se tam chrootne
* Pokud chcete, můžete si nastavit, co se má spustit po chrootu. Ve výchozím stavu se spustí X server s minimálním prostředím, ve kterém se zobrazí obsah flashky

Vytvořeno na zahajovací výpravu 2021
(homer-virus se to jmenuje jako odkaz na našeho bývalého vůdce oddílu - Homera)
