<p align="right">Dapatkan 100$ Credit Trial selama 60 hari untuk membeli VPS disini.</p>
<p align="right"><a href="https://www.digitalocean.com/?refcode=825d86d58739&utm_campaign=Referral_Invite&utm_medium=Referral_Program&utm_source=badge"><img src="https://web-platforms.sfo2.cdn.digitaloceanspaces.com/WWW/Badge%201.svg" alt="DigitalOcean Referral Badge" /></a></p>

<p align="center" width="100%">
    <img width="10%"  src="https://user-images.githubusercontent.com/50621007/166148846-93575afe-e3ce-4ca5-a3f7-a21e8a8609cb.png">
</p>

# Quicksilver Node Full Setup
  
  Untuk versi ini sudah termasuk versi <code>v0.4.1</code> dan data snapshot (langsung lompat ke block <code>104000~</code> tanpa harus memulai dari block pertama).
  
## Install Full Setup

  Instalasi ini saya ambil dari [KjNodes](https://github.com/kj89/testnet_manuals/blob/main/quicksilver/quicksilver.sh), hanya mengubah bahasa dan beberapa tambahan data.
  
```
wget -O quicksilver.sh https://raw.githubusercontent.com/yantodotid/testnet/main/quicksilver/quicksilver.sh && chmod +x quicksilver.sh && ./quicksilver.sh
```

### Cek Status Sinkron
    
   Untuk cek status agar bisa melihat <code>latest_block_height</code> sudah mencapai terbaru atau tidak. Kalian juga bisa melihat latest blocknya disini [[NG] Explorer](https://quicksilver.explorers.guru/)

   ```
   quicksilverd status 2>&1 | jq .SyncInfo
   ```
    
### Add Wallet
    
   Lakukan ini jika memang baru pertama kali membuat node, jika kalian **sudah punya wallet** bisa **skip** bagian ini. Ingat **nama_wallet** ganti dengan nama kalian!
   
   ```
   quicksilverd keys add nama_wallet
   ```
   
### Recovery Wallet
    
   Jika kalian sudah punya wallet, bisa langsung recover dengan menggunakan mnemonic kalian. Ingat **nama_wallet** ganti dengan nama kalian!
    
   ```
   quicksilverd keys add nama_wallet --recover
   ```
   
### Recover Validator
  
   Untuk kalian yang sebelumnya sudah punya validator bisa lakukan ini agar saat sinkron selesai, block validatornya akan hijau. Jika kalian baru **pertama kali join QuickSilver Testnet**, kalian bisa **skip** bagian ini.
   
   ```
   nano .quicksilverd/config/priv_validator_key.json
   ```
   Lalu hapus isinya dan gantikan dengan yang sudah kalian simpan sebelumnya. Setelah selesai tekan <code>CTRL+O</code> untuk save dan <code>CTRL+X</code> untuk exit. Kemudian restart node kalian.
   
   ```
   sudo systemctl restart quicksilverd
   ```
    
### List Wallet

   Untuk memastikan bahwa wallet kalian sudah di tambah atau di recover.
    
   ```
   quicksilverd keys list
   ```
    
### Request Faucet
    
   Untuk kalian yang baru pertama kali mengikuti QuickSilver Testnet, kalian pertama harus join grup discord untuk mendapatkan QCK Faucetnya. [Link Discord](https://discord.gg/r6YU9yWfgQ)
    
  - Masuk ke channel <code>#qck-tap</code> dan masukkan address kalian (ganti quick_address dengan address yang sudah kalian buat tadi dibagian [List Wallet](https://github.com/yantodotid/testnet/blob/main/quicksilver#List-Wallet).

   ```
   $request quick_address killerqueen
   ```
    
### Create Validator
   
   Setelah request faucet, kalian buat validatornya dengan command berikut ini.
   
   --from="**nama_wallet**" dan --moniker="**nama_validator**" tulisan yang ditebalkan ganti dengan nama kalian.
   
   ```
   quicksilverd tx staking create-validator \
  --amount 5000000uqck \
  --from="nama_wallet" \
  --commission-max-change-rate "0.01" \
  --commission-max-rate "0.2" \
  --commission-rate "0.059" \
  --min-self-delegation "1" \
  --pubkey  $(quicksilverd tendermint show-validator) \
  --moniker="nama_validator" \
  --chain-id killerqueen-1 \
  --gas=auto \
  -y
   ```
    
   Setelah selesai membuat Validator, kalian bisa cek validator kalian disini [[NG] Explorer](https://quicksilver.explorers.guru/validators) dan cari nama validator yang sudah kalian buat tadi. Jika di menu <code>ACTIVE</code> tidak ada, kalian bisa temukan dibagian menu <code>INACTIVE</code>.
    
### Source

<blockquote>
  
  - [Official Instructions (Install Nodes)](https://github.com/ingenuity-build/testnets/blob/main/killerqueen/INSTALL.md)
  - [KjNodes (Script and Tutorial)](https://github.com/kj89/testnet_manuals/tree/main/quicksilver)
  - [TestNetRun (Snapshot Data)](https://snapshot.testnet.run/testnet/quicksilver/)
  
</blockquote>