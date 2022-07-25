<p align="right">Dapatkan 100$ Credit Trial selama 60 hari untuk membeli VPS disini.</p>
<p align="right"><a href="https://www.digitalocean.com/?refcode=825d86d58739&utm_campaign=Referral_Invite&utm_medium=Referral_Program&utm_source=badge"><img src="https://web-platforms.sfo2.cdn.digitaloceanspaces.com/WWW/Badge%201.svg" alt="DigitalOcean Referral Badge" /></a></p>


# Tutorial Full Setup StakeWars Node


<p align="center">
<img src="https://user-images.githubusercontent.com/35837931/180386866-d7d109a2-bf61-4ebf-ae8e-26f64604a094.png"  width="500px"/>
<p>


Sebelum Setup Node, Minimum spesifikasi VPS yang perlu kalian gunakan adalah sebagai berikut.


| Hardware       | Chunk-Only Producer  Specifications                                   |
| -------------- | ---------------------------------------------------------------       |
| CPU            | 4-Core CPU with AVX support                                           |
| RAM            | 8GB DDR4                                                              |
| Storage        | 500GB SSD                                                             |


## Setup DigitalOcean
Sebelum menjalankan Stakewars, kalian harus membuat [Droplet](https://www.digitalocean.com/products/droplets) dari [DigitalOcean](https://www.digitalocean.com/?refcode=825d86d58739&utm_campaign=Referral_Invite&utm_medium=Referral_Program&utm_source=badge) terlebih dahulu dengan cara berikut ini.

1. Kalian buat droplet dengan spesifikasi dibawah ini.

    ![Screenshot_49_1](https://user-images.githubusercontent.com/35837931/180670413-b90861e2-f782-46b9-b68c-f2e8c8a374b0.png)

    Jika kalian masih user baru, kalian harus meminta request ke DigitalOcean untuk membuat Droplet pada spesifikasi diatas agar bisa digunakan untuk menjalankan Stakewars nanti dan juga siapkan dana sebesar 262$ untuk mengaktifkan VPS dengan spesifikasi tersebut nanti.

2. Pilih server London

    ![Screenshot_51](https://user-images.githubusercontent.com/35837931/180670530-110d4316-3b4d-451d-bab0-952d307a005f.png)

    Karena Stakewars ini membutuhkan bandwidth internet yang sangat cepat agar tidak terlambat untuk mencari block dan chunk.
  
3. Buat password untuk login ke VPS

    ![Screenshot_52](https://user-images.githubusercontent.com/35837931/180670612-82ba184c-bbcb-42f7-9cff-63682d4187e5.png)

    Pastikan kalian simpan dengan aman password kalian agar tidak ada satupun orang yang mengetahui password VPS kalian nanti.
  
4. Ubah nama hostname sesuai keinginan kalian

    ![Screenshot_56](https://user-images.githubusercontent.com/35837931/180671159-c37479ea-5cc6-4416-a8a4-d2b2d615411a.png)

5. Lalu Create Droplet

    ![Screenshot_54](https://user-images.githubusercontent.com/35837931/180670721-1898b0d9-ee24-4bd8-bb26-16c41e70eb2c.png)

6. Selamat kalian sudah membuat Droplet untuk menjalankan Stakewars.

    ![Screenshot_55](https://user-images.githubusercontent.com/35837931/180670944-f68092b4-5291-4044-bfa7-ad1de1c50e5b.png)

    Setelah itu kalian bisa login VPS menggunakan `IPv4` yang sudah dibuat dengan aplikasi seperti [MobaXterm](https://mobaxterm.mobatek.net/download.html), [Termius](https://termius.com/) dan lain sebagainya. Lalu masukkan password yang kalian buat tadi dan kalian bisa menjalankan challenges-nya dibawah ini.
  
## Challenge

Challenge ini bisa kalian kerjakan hingga tanggal `11 Agustus 2022` dan jangan lupa juga untuk isi `Chunk-Only Producer Onboarding Form` [disini](https://nearprotocol1001.typeform.com/to/Z39N7cU9). Untuk bagian ID bisa isi dengan email kalian.

| Challenges | Deskripsi                             | Tanggal Mulai | Tanggal Selesai | Link                                                              |
| ---------- | ------------------------------------- | ------------- | --------------- | ----------------------------------------------------------------- |
| 001        | Setup NEAR-CLI                        | 13 Juli 2022  | 11 Agustus 2022 |[Tutorial](https://github.com/yantodotid/testnet/blob/main/stakewars/task/001.md) |
| 002        | Setup Wallet dan Run Validator        | 13 Juli 2022  | 11 Agustus 2022 |[Tutorial](https://github.com/yantodotid/testnet/blob/main/stakewars/task/002.md) |
| 003        | Mounting Staking Pool                 | 13 Juli 2022  | 11 Agustus 2022 |[Tutorial](https://github.com/yantodotid/testnet/blob/main/stakewars/task/003.md) |
| 004        | Membuat Monitoring Node Status        | 13 Juli 2022  | 11 Agustus 2022 |[Tutorial](https://github.com/yantodotid/testnet/blob/main/stakewars/task/004.md) |
| 005        | Membuat Tutorial Stakewars            | 15 Juli 2022  | 11 Agustus 2022 |-                                                                  |
| 006        | Membuat Ping Otomatis Setiap 5 Menit  | 19 Juli 2022  | 11 Agustus 2022 |[Tutorial](https://github.com/yantodotid/testnet/blob/main/stakewars/task/006.md) |
| 007        | Membuat Data Science untuk Staking    | 22 Juli 2022  | 07 September 2022 |-                                                                |


Form for Submission Challenges 5-7 [disini](https://docs.google.com/forms/d/e/1FAIpQLScp9JEtpk1Fe2P9XMaS9Gl6kl9gcGVEp3A5vPdEgxkHx3ABjg/viewform).
