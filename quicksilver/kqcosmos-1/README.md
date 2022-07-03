<p align="right">Dapatkan 100$ Credit Trial selama 60 hari untuk membeli VPS disini.</p>
<p align="right"><a href="https://www.digitalocean.com/?refcode=825d86d58739&utm_campaign=Referral_Invite&utm_medium=Referral_Program&utm_source=badge"><img src="https://web-platforms.sfo2.cdn.digitaloceanspaces.com/WWW/Badge%201.svg" alt="DigitalOcean Referral Badge" /></a></p>

<p align="center" width="100%">
    <img width="10%"  src="https://user-images.githubusercontent.com/50621007/166148846-93575afe-e3ce-4ca5-a3f7-a21e8a8609cb.png">
</p>

# Cara Menggunakan Snapshot <code>KQCOSMOS-1</code>
Cara ini digunakan untuk mempercepat sinkronisasi pada jaringan <code>kqcosmos-1</code> dari <code>Quicksilver</code>.
Sebelum melakukan Snapshot, pastikan kalian sudah backup file <code>priv_validator_key.json</code> dan <code>mnemonic</code> agar jika ada kesalahan masih bisa recovery akun validator dan wallet kalian.

## Ambil Data Snapshot KQCOSMOS-1
Dibagian ini kalian diharuskan men-download data snapshot untuk mempercepat sinkronisasi dalam waktu 5-10 menit saja. Kalian akan melakukan download data snapshot dan tunggu hingga 100%. <code>***Ingat, lakukan command satu persatu agar tidak terjadi error!***</code>


- **Stop Node**
```
sudo systemctl stop icad
```
- **Reset data dan men-download data sinkronisasi**

  Tunggu hingga 100% dan nanti akan otomatis ter-extract ke folder data.
```
cd $HOME

icad tendermint unsafe-reset-all

URL="https://snapshot.testnet.run/testnet/kqcosmos/killerqueen-1_2022-06-30.tar"

wget -O - $URL | tar -xvf - -C $HOME/.ica/data
```

## Jalankan Node
Setelah selesai download, kalian langsung saja start Node kalian untuk memastikan kalau snapshot kalian sudah berjalan dengan lancar.

- Start Node

```
sudo systemctl start icad
```
- Cek Sinkronisasinya

```
icad status 2>&1 | jq .SyncInfo
```
- Jika muncul seperti ini maka node kalian sudah berjalan dan tunggu saja hingga mencapai block terbaru.
```
{
  "latest_block_hash": "F4A960877DB8E49DCD44110322351F587E8CFFA3FF338675D9AF8134DC4319C3",
  "latest_app_hash": "1B2C3E4A9C724BDC6C1670C23E423148AA966677BFAF615788CC76544A622CC7",
  "latest_block_height": "130256",
  "latest_block_time": "2022-07-03T05:08:51.180924586Z",
  "earliest_block_hash": "4D9C35CA980EA3B83AA4E02E51CF41E579D3602C38AFB05FAF0CCF03DDF2BADB",
  "earliest_app_hash": "2B380A9122C1BEC253E97530D7245FA1C337366619286B42F15777B8B90A0A34",
  "earliest_block_height": "104201",
  "earliest_block_time": "2022-07-01T07:02:33.952617692Z",
  "catching_up": true
}
```
Jika sudah selesai maka <code>"catching_up": true</code> akan berubah ke <code>"catching_up": false</code> dan selamat kalian sudah melakukan sinkronisasi dengan cepat tanpa menunggu lama berhari hari.

## Source
<blockquote>

- [Official Instruction](https://github.com/ingenuity-build/testnets)

- [TestNetRun](https://snapshot.testnet.run/testnet/kqcosmos/)
  
  
</blockquote>
