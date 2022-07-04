<p align="right">Dapatkan 100$ Credit Trial selama 60 hari untuk membeli VPS disini.</p>
<p align="right"><a href="https://www.digitalocean.com/?refcode=825d86d58739&utm_campaign=Referral_Invite&utm_medium=Referral_Program&utm_source=badge"><img src="https://web-platforms.sfo2.cdn.digitaloceanspaces.com/WWW/Badge%201.svg" alt="DigitalOcean Referral Badge" /></a></p>

<p align="center" width="100%">
    <img width="10%"  src="https://user-images.githubusercontent.com/50621007/166148846-93575afe-e3ce-4ca5-a3f7-a21e8a8609cb.png">
</p>

### Daftar Isi :
<blockquote>
    
- [Cara Menggunakan Snapshot Killerqueen-1](https://github.com/yantodotid/Testnet/tree/main/quicksilver#cara-menggunakan-snapshot-quicksilver-killerqueen-1)
- [Hapus data QuickSilver](https://github.com/yantodotid/Testnet/tree/main/quicksilver#hapus-data-quicksilver)
- [Install QuickSilver](https://github.com/yantodotid/Testnet/tree/main/quicksilver#install-quicksilver)
- [Sinkronisasi](https://github.com/yantodotid/Testnet/tree/main/quicksilver#sinkronisasi)
- [Update QuickSilver ke versi v0.4.1](https://github.com/yantodotid/Testnet/tree/main/quicksilver#update-quicksilver-ke-versi-v041)
- [Ambil Data Snapshot](https://github.com/yantodotid/Testnet/tree/main/quicksilver#ambil-data-snapshot)
- [Jalankan Node](https://github.com/yantodotid/Testnet/tree/main/quicksilver#jalankan-node)
- [Restore Validator dan Wallet](https://github.com/yantodotid/Testnet/tree/main/quicksilver#restore-validator-dan-wallet)
    
</blockquote>


# Cara Menggunakan Snapshot QuickSilver <code>KILLERQUEEN-1</code>


Cara ini digunakan untuk mempercepat sinkronisasi Quicksilver dalam waktu 30-60 menit saja. Ini tergantung spek VPS-nya, mungkin bisa cepat atau lambat (yang jelas tidak menunggu berhari-hari).

## Hapus data QuickSilver
Sebelum melakukan ini, harap backup data-data penting kalian seperti <code>priv_validator_key.json</code> dan <code>mnemonic</code> kalian! Karena jika tidak, maka kalian ***tidak akan bisa menjalankan validatornya dan kehilangan selamanya!*** Jika kalian baru pertama kali menggunakan Quicksilver, kalian bisa **abaikan** bagian ini.

```
sudo systemctl stop quicksilverd
sudo systemctl disable quicksilverd
sudo rm /etc/systemd/system/quicksilver* -rf
sudo rm $(which quicksilverd) -rf
sudo rm $HOME/.quicksilver* -rf
sudo rm $HOME/quicksilver -rf
```

## Install QuickSilver
Install Quicksilver dari awal dan jika kalian baru pertama kali install QuickSilver harap lakukan command ini terlebih dahulu sebelum memulai install.

```
sudo apt install && sudo apt upgrade
```
Setelah itu lakukan install Quicksilver.

```
wget -O quicksilver.sh https://raw.githubusercontent.com/kj89/testnet_manuals/main/quicksilver/quicksilver.sh && chmod +x quicksilver.sh && ./quicksilver.sh
```

Setelah install selesai, jangan lupa masukkan variablenya ke dalam sistem.

```
source $HOME/.bash_profile
```

Thanks to [KjNodes](https://github.com/kj89/testnet_manuals/tree/main/quicksilver)

## Sinkronisasi
Cek sinkronisasi untuk memastikan jika Node kalian sudah jalan dengan command berikut ini.

```
quicksilverd status 2>&1 | jq .SyncInfo
```

Jika sudah muncul kurang lebih contohnya seperti ini. **Ingat** setiap user memiliki input yang berbeda-beda setiap pertama kali instalisasi.

```
{
  "latest_block_hash": "4D080DC2C3733316B2121314BA22FE7359E2DA537897967DEF645F2F774BAB7B",
  "latest_app_hash": "D1CF57D4CF15F2F4F736E0511B228F4BBA9E839E9BC96AE430A066A19CB60500",
  "latest_block_height": "100",
  "latest_block_time": "2022-07-03T01:42:44.737537726Z",
  "earliest_block_hash": "D317A8E51CD2CA795CD54621A2FB59CD36A207E5381F941AEC1B95F771C1243F",
  "earliest_app_hash": "5134C1CD7211E489E40E1704ECF6CB92F04499E5F30804EA860E1F6D35F77B60",
  "earliest_block_height": "1",
  "earliest_block_time": "2022-06-28T18:39:44.869949181Z",
  "catching_up": true
}
```

Setelah sudah muncul seperti itu, stop nodenya.

```
sudo systemctl stop quicksilverd
```

## Update Quicksilver ke versi v0.4.1
Update Quicksilver ke versi yang terbaru, karena versi yang saat ini kalian install adalah versi **v0.4.0**. Untuk cara upgrade ke versi baru bisa lakukan command berikut ini. <code>***Ingat, lakukan commandnya satu persatu agar tidak terjadi error!***</code>

```
cd $HOME

rm quicksilver -rf

git clone https://github.com/ingenuity-build/quicksilver.git --branch v0.4.1

cd quicksilver

make build

sudo chmod +x ./build/quicksilverd && sudo mv ./build/quicksilverd /usr/local/bin/quicksilverd

cd $HOME
```
- Cek versi terbarunya.

```
quicksilverd version
```
Jika sudah muncul <code>v0.4.1</code> maka sudah memakai versi terbarunya, lanjut ke step selanjutnya.

## Ambil Data Snapshot 
Dibagian ini kalian diharuskan men-download data snapshot untuk mempercepat sinkronisasi dalam waktu 5-10 menit saja. Kalian akan melakukan download data snapshot dan tunggu hingga 100%. <code>***Ingat, lakukan command satu persatu agar tidak terjadi error!***</code>

- Reset semua data Quicksilver

```
quicksilverd tendermint unsafe-reset-all
```

- Download Data Snapshot

    Download Data Snapshot ini membutuhkan waktu kurang lebih 5-10 menit (setiap VPS kecepatan bandwidth berbeda-beda).

```
rm -rf $HOME/.quicksilverd/data/*

URL="https://snapshot.testnet.run/testnet/quicksilver/killerqueen-1_2022-07-02.tar"

wget -O - $URL | tar -xvf - -C $HOME/.quicksilverd/data
```

- Kembali lagi ke Home :

```
cd $HOME
```

## Jalankan Node
Setelah selesai download, kalian langsung saja start Node kalian untuk memastikan kalau snapshot kalian sudah berjalan dengan lancar. Data snapshot ini akan dimulai dari block <code>104000~</code>, jadi tidak perlu memulai dari block pertama.

- Start Node

```
sudo systemctl start quicksilverd
```

- Cek sinkronisasi

```
quicksilverd status 2>&1 | jq .SyncInfo
```

- Cek Log (Opsional)

    Hanya untuk memastikan kalau sudah jalan blocknya, kalian bisa skip bagian ini jika sudah muncul blocknya.

```
sudo journalctl -u quicksilverd -f -o cat
```
Untuk keluar tinggal tekan tombol <code>CTRL + Z</code>.

## Restore Validator dan Wallet
Untuk bagian ini jika validator kalian masih tetap merah tetapi status sudah <code>false</code> bisa lakukan cara ini.

- Stop dahulu nodenya.

```
sudo systemctl stop quicksilverd
```

- Buka file <code>priv_validator_key.json</code> untuk di edit.

```
nano .quicksilverd/config/priv_validator_key.json
```
Hapus semua isinya dan ganti dengan <code>priv_validator_key.json</code> yang sudah kalian simpan sebelumnya, setelah selesai tekan tombol <code>CTRL+O</code> dan <code>CTRL+X</code>.

- Import Mnemonic Akun QuickSilver

```
quicksilverd keys add wallet --recover
```
setelah memasukkan mnemonicnya, lalu jalankan kembali Nodenya dan selamat kalian sudah selesai sinkronisasi QuickSilver dengan cepat!

```
sudo systemctl start quicksilverd
```

### Source
<blockquote>
    
- [Official Instruction](https://github.com/ingenuity-build/testnets)

- [KjNodes](https://github.com/kj89/testnet_manuals/tree/main/quicksilver)

- [TestNetRun](https://snapshot.testnet.run/testnet/quicksilver/)


    
</blockquote>

