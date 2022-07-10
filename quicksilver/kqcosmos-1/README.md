<p align="right">Dapatkan 100$ Credit Trial selama 60 hari untuk membeli VPS disini.</p>
<p align="right"><a href="https://www.digitalocean.com/?refcode=825d86d58739&utm_campaign=Referral_Invite&utm_medium=Referral_Program&utm_source=badge"><img src="https://web-platforms.sfo2.cdn.digitaloceanspaces.com/WWW/Badge%201.svg" alt="DigitalOcean Referral Badge" /></a></p>

<p align="center" width="100%">
    <img width="10%"  src="https://user-images.githubusercontent.com/50621007/166148846-93575afe-e3ce-4ca5-a3f7-a21e8a8609cb.png">
</p>

# Cara Menggunakan Snapshot <code>KQCOSMOS-1</code>
Cara ini digunakan untuk mempercepat sinkronisasi pada jaringan <code>kqcosmos-1</code> dari <code>Quicksilver</code>.
Sebelum melakukan Snapshot, pastikan kalian sudah backup file <code>priv_validator_key.json</code> dan <code>mnemonic</code> agar jika ada kesalahan masih bisa recovery akun validator dan wallet kalian.

## Backup Data
Untuk bagian ini hanya untuk kalian yang belum mem-backup <code>priv_validator_key.json</code> saja. Jika kalian sudah menyimpannya, bisa abaikan step bagian ini.
```
nano .ica/config/priv_validator_key.json
```
Lalu copy isi data tersebut dan simpan dalam notepad kalian atau catatan. Setelah itu keluar dari nano dengan tekan <code>CTRL+X</code>.

## Ambil Data Snapshot KQCOSMOS-1
Dibagian ini kalian diharuskan men-download data snapshot untuk mempercepat sinkronisasi dalam waktu 1 jam atau lebih (tergantung spesifikasi VPS). Kalian akan melakukan download data snapshot dan tunggu hingga 100%. <code>***Ingat, lakukan command satu persatu agar tidak terjadi error!***</code>


- **Stop Node**
```
sudo systemctl stop icad
```
- **Reset data dan men-download data sinkronisasi**

  Tunggu hingga 100% dan nanti akan otomatis ter-extract ke folder data.
```
cd $HOME

icad tendermint unsafe-reset-all --home ~/.ica/

rm -rf $HOME/.ica/data/*

URL="https://snapshot.testnet.run/testnet/kqcosmos/kqcosmos-1_2022-07-09.tar"

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
  "latest_block_height": "208289",
  "latest_block_time": "2022-07-03T05:08:51.180924586Z",
  "earliest_block_hash": "4D9C35CA980EA3B83AA4E02E51CF41E579D3602C38AFB05FAF0CCF03DDF2BADB",
  "earliest_app_hash": "2B380A9122C1BEC253E97530D7245FA1C337366619286B42F15777B8B90A0A34",
  "earliest_block_height": "104201",
  "earliest_block_time": "2022-07-01T07:02:33.952617692Z",
  "catching_up": true
}
```

- Cek Log (Opsional)

    Hanya untuk memastikan kalau sudah jalan blocknya, kalian bisa skip bagian ini jika sudah muncul blocknya.

```
sudo journalctl -u icad -f -o cat
```

Untuk keluar tinggal tekan tombol <code>CTRL + Z</code>.

Jika sudah selesai maka <code>"catching_up": true</code> akan berubah ke <code>"catching_up": false</code> dan selamat kalian sudah melakukan sinkronisasi dengan cepat tanpa menunggu lama berhari hari.

## Recovery Data
Setelah selesai sinkronisasi, kembalikan lagi data penting kalian tadi seperti <code>mnemonic</code> (seharusnya sudah kalian simpan saat pertama kali membuat wallet) dan <code>priv_validator_key</code>.
- Add Wallet
```
icad keys add nama_wallet --recover --keyring-backend=test
```
<code>--keyring-backend=test</code> digunakan agar tidak perlu memasukkan password saat melakukan transaksi, tetapi kalian bebas untuk menggunakan atau tidak.

- Edit Validator

```
nano .ica/config/priv_validator_key.json
```
Lalu hapus isinya dan masukkan kode yang sudah kalian simpan dalam notepad atau catatan. Kemudian tekan <code>CTRL+X</code> dan <code>Yes</code>. 

Selamat, kalian sudah selesai melakukan snapshot dan recovery data kalian dengan aman, Happy Testnet!

## Source
<blockquote>

- [Official Instruction](https://github.com/ingenuity-build/testnets)

- [TestNetRun](https://snapshot.testnet.run/testnet/kqcosmos/)
  
  
</blockquote>
