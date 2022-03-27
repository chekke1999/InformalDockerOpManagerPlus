# Informal Docker OpManager Plus
非公式のDocker用opmanager plus。商用ツールなのでopmanagerのバイナリファイルは同封してないです。ManageEngine式ページからインストーラの"ManageEngine_OpManager_Plus_64bit.bin"を入手して直下においてください。
## Enviroment variable
expectを使った対話型のセットアップ時に渡す値。初期値はすべて空白の""だが、なにも値を入れなければopmanagerのInstallerが初期値に設定している値で処理される。実行時にexpect側で"\n"を連結して処理する。(expectに環境変数で"\n"を渡すと改行コードではなくそのまま文字列として入力されてしまう為)

### INSTALL_PATH
インストール先のpathを指定する。  
なにも指定しなければ/opt/ManageEngine/OpManagerが使われる。

example
```yml
version: '3.7'
services:
  opmanager:
    environment:
      INSTALL_PATH: /root/ManageEngine/OpManager
      TZ: Asia/Tokyo
```
### WEB_PORT
WebUIので用いるport番号の指定。  
なにも指定しなければ8060が使われる。

example
```yml
version: '3.7'
services:
  opmanager:
    environment:
      INSTALL_PATH: /root/ManageEngine/OpManager
      TZ: Asia/Tokyo
```
### NETFLOW_PORT
netflowやsflow等のxflowで用いるポート番号の指定。  
何も指定しなければ9996が使われる。

example
```yml
version: '3.7'
services:
  opmanager:
    environment:
      INSTALL_PATH: /root/ManageEngine/OpManager
      TZ: Asia/Tokyo
```