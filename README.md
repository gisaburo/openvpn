# openvon構築検証
## 目的
- kvm内にvpn serverとvpn clientを立てて通信できるか検証
## 留意点
- 実用的な検証にするため、仮想ルータを配置して疑似インターネット空間を構築、グルーバル想定のIPからdnatでイントラの想定のIPにポートフォワードを設定して検証
## 材料
- os
  - kvm fedora33
  - router cumulus vx 4.2
  - vpn server fedora33
  - vpn client fedora33
## 工程
1. kvm設定
    - kvmフォルダ参照
1. routing設定
    - serverフォルダ(cumulus*.md参照)
1. vpn server設定
    - serverフォルダ(vpn-server.md参照)
1. vpn client設定
    - serverフォルダ(vpn-client.md参照)
1. 接続テスト
    - appendixフォルダ参照