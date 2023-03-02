# Snapshot Nolus

<p align="center"><a href="https://user-images.githubusercontent.com/35837931/222352100-98326947-91a4-4794-a57c-20cf13458a55.png"><img src="https://user-images.githubusercontent.com/35837931/222352100-98326947-91a4-4794-a57c-20cf13458a55.png" /></a></p>


1. Stop your node

```bash
sudo systemctl stop nolusd
```

2. Reset all data and save your `priv_validator_state.json`

```bash
cp $HOME/.nolus/data/priv_validator_state.json $HOME/.nolus/priv_validator_state.json.backup
rm -rf $HOME/.nolus/data
```

3. Download latest snapshot

```bash
curl -L http://snapshot.nolus.singopedia.my.id/snapshot_nolus.tar.lz4 | tar -Ilz4 -xf - -C $HOME/.nolus
```

4. Move your `priv_validator_state.json` to `.nolus/data` folder

```bash
mv $HOME/.nolus/priv_validator_state.json.backup $HOME/.nolus/data/priv_validator_state.json
```

5. Start your node

```bash
sudo systemctl start nolusd && sudo journalctl -fu nolusd -o cat
```

6. Done your node is syncing with latest block height.
