<p align="center" width="100%">
    <img width="10%"  src="https://user-images.githubusercontent.com/50621007/166148846-93575afe-e3ce-4ca5-a3f7-a21e8a8609cb.png">
</p>


# Cara Menggunakan Snapshot QuickSilver


Cara ini digunakan untuk mempercepat sinkronisasi Quicksilver dalam waktu 5-10 menit saja.

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
  "latest_block_height": "108613",
  "latest_block_time": "2022-07-03T01:42:44.737537726Z",
  "earliest_block_hash": "D317A8E51CD2CA795CD54621A2FB59CD36A207E5381F941AEC1B95F771C1243F",
  "earliest_app_hash": "5134C1CD7211E489E40E1704ECF6CB92F04499E5F30804EA860E1F6D35F77B60",
  "earliest_block_height": "66001",
  "earliest_block_time": "2022-06-28T18:39:44.869949181Z",
  "catching_up": false
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
```

## Ambil Data Snapshot 
Dibagian ini kalian diharuskan men-download data snapshot untuk mempercepat sinkronisasi dalam waktu 5-10 menit saja. Kalian akan melakukan download data snapshot dan tunggu hingga 100%. <code>***Ingat, lakukan command satu persatu agar tidak terjadi error!***</code>

```
quicksilverd tendermint unsafe-reset-all

rm -rf $HOME/.quicksilverd/data/*

URL="https://snapshot.testnet.run/testnet/quicksilver/killerqueen-1_2022-07-02.tar"

wget -O - $URL | tar -xvf - -C $HOME/.quicksilverd/data
```

## Jalankan Node
Setelah selesai download, kalian langsung saja start Node kalian untuk memastikan kalau snapshot kalian sudah berjalan dengan lancar.

- Start Node

```
sudo systemctl start quicksilverd
```

- Cek sinkronisasi

```
quicksilverd status 2>&1 | jq .SyncInfo
```

- Cek Log

```
sudo journalctl -u quicksilverd -f -o cat
```
Untuk keluar tinggal tekan tombol <code>CTRL + Z</code>.

## Restore Validator dan Wallet
Untuk bagian ini jika validator kalian masih tetap merah tetapi status sudah false bisa lakukan cara ini.

- Buka file <code>priv_validator_key.json</code> untuk di edit.

```
nano .quicksilverd/config/priv_validator_key.json
```
Semua isinya dengan <code>priv_validator_key.json</code> yang sudah kalian simpan sebelumnya, setelah selesai tekan tombol <code>CTRL + O</code> dan <code>CTRL + X</code>.

- Import Mnemonic Akun QuickSilver

```
quicksilverd keys add wallet --recover
```
setelah memasukkan mnemonicnya, lalu hidupkan Nodenya dan selamat kalian sudah selesai sinkronisasi QuickSilver dengan cepat!

### Source
> - [Official Instruction](https://github.com/ingenuity-build/testnets)

> - [KjNodes](https://github.com/kj89/testnet_manuals/tree/main/quicksilver)

> - [TestNetRun](https://snapshot.testnet.run/testnet/quicksilver/)

