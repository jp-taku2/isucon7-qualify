# isucon7-qualify

2017年に開催されたisuconの予選問題をvagrantで立ちあげれるようにしたものです。
buildに時間がかかってしまうので、既存の*Vagrantfile&*を使って利用します。

自分で作りたい方はVagrantfile_buildをrenameして使ってください。

## boxの仕様
- メモリ：1G　CPU：1core　disk:20G
- ネットワーク構成も本番に近づけるため、ホスト側から通信ができない内部向けのネットワークを設定しています。  
内部向け：10.0.0.101\~103
ホスト用：192.168.56.101\~103
- ネットワーク帯域をさくらクラウドに合わせ500Mbpsに絞ってあります。


# 起動方法

```
git clone git@github.com:jp-taku2/isucon7-qualify.git
cd isucon7-qualify
vagrant up
```

本番同様にisucon userを作成済みです。
password

```
user:password

ubuntu:vagrant
vagrant:vagrant
isucon:isucon
```

# bench
ベンチについてもVagrantfileに設定済みです。
node04がそれに当たります。

ベンチの使い方に関しては以下を参照してください。  
[isucon/isucon7-qualify](https://github.com/isucon/isucon7-qualify) 
