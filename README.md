# P2HACKS2022 アピールシート 

プロダクト名  

![My project-1 (7)](https://user-images.githubusercontent.com/105771941/208232796-b9c8f3aa-1b01-4f6b-9d6a-f6d0d4969010.png)

コンセプト  

![image](https://user-images.githubusercontent.com/105771941/208232588-fbce0a72-b97b-48bb-86f6-64c796a250d0.png)


対象ユーザ  
社会貢献をして、クーポンのほしいユーザ

利用の流れ  
クーポンのほしいユーザが店の前に落ちているゴミを拾い，店の景観を守り，未来の地球も守る．

推しポイント  
公開鍵，秘密鍵方式を採用し，QRのセキュリティ上の問題を解決しました．スロットゲームを採用することで，スーパのスロットゲームを遊ぶ感覚で子供から大人まで路上のゴミを掃除を促進することを可能としました．
スロットゲームは円から柄がどの角度に位置しているかを計算し，柄の傾きを動的に変化させることでリアルさを追求しました．
Linux版のみだが，音が出るようにし，CR牙狼〈GARO〉の効果音が爆音でなるようにしました．


スクリーンショット(任意)  

- ゴミ箱側
![waitScreen](https://user-images.githubusercontent.com/105771941/208229215-4d56b64d-2420-4580-a357-eb77aa5080db.png)

- 全回転するスロット
![image](https://user-images.githubusercontent.com/82094614/208278517-d86192e7-3c0e-450a-8592-7b07afa1d2f9.png)

## 開発体制  

役割分担  
- B2 山内 Webアプリ側
- B1 松下 ゴミ箱側

開発における工夫した点  
...  
Python
- 画像切り替えでスレッドを立て切り替えできるようにした
共通
- RSA暗号により強固なQRコード生成を可能とした
- SSHを利用し，ノートパソコンからラズパイのコードの編集を行った
Dart
- Canvasを利用して，スロットゲームの描画を行った
- GithubActionsを利用して，静的解析を行った
- 


## 開発技術 

利用したプログラミング言語  
- Dart
- Python

利用したフレームワーク・ライブラリ  

Dart
- flutter
  - cupertino_icons: ^1.0.2
  - hooks_riverpod: ^2.1.1
  - auto_route: ^5.0.4
  - flutter_hooks: ^0.18.5+1
  - freezed: ^2.3.2
  - json_serializable: ^6.5.4
  - google_sign_in: ^5.4.2
  - google_sign_in_web: ^0.10.2
  - logger: ^1.1.0
  - firebase_auth: ^4.2.0
  - cloud_firestore: ^4.2.0
  - firebase_core: ^2.4.0
  - flutter_signin_button: ^2.0.0
  - mobile_scanner: ^2.1.0
  - encrypt: ^5.0.1
  - funvas: ^0.1.7
  - assets_audio_player: ^3.0.6
  - just_audio: ^0.9.30
  - flex_color_scheme: ^6.1.1
  

Python
- tkinter
- threading
- time
- uuid
- colorama==0.4.6
- numpy==1.23.5
- opencv-python==4.6.0.66
- Pillow==9.3.0
- pyasn1==0.4.8
- pycryptodome==3.16.0
- qrcode==7.3.1
- rsa==4.9

その他開発に使用したツール・サービス
- Firebase
- Raspberry Pi
