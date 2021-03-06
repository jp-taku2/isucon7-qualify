# isucon7-qualify

# aws

## amiの仕様 
amiにはネットワークの帯域制限が設定されています。
スペック等は本番に準拠した形になっておりますが、クラウドが別なため全く同じわけではありません。

ネットワークはNICを追加して10.0.1.0/24の固定IPをterraformにて割り振ります。

## 準備
- `terraform/aws/terraform.tfvars` にAWSのkeyを設定してください。

- `terraform/aws/main.tf` の[96,134,172,210]行目で鍵を設定しているので、任意のものに変更してください。

## 起動方法
```
git clone git@github.com:jp-taku2/isucon7-qualify.git
cd isucon7-qualify/terraform/aws

terraform init
terraform apply
```
## bench
ベンチマーカについては4台目がそれに当たります。
公式が公開したものを使用しておりますが、複数台に対する実行方法できていません。

# vagrant
2017年に開催されたisuconの予選問題をvagrantで立ちあげれるようにしたものです。
buildに時間がかかってしまうので、既存の*Vagrantfile&*を使って利用します。

自分で作りたい方はVagrantfile_buildをrenameして使ってください。

## boxの仕様
- メモリ：1G　CPU：1core　disk:20G
- ネットワーク構成も本番に近づけるため、ホスト側から通信ができない内部向けのネットワークを設定しています。  
内部向け：10.0.0.101\~103
ホスト用：192.168.56.101\~103
- ネットワーク帯域をさくらクラウドに合わせ500Mbpsに絞ってあります。


## 起動方法

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

## bench
ベンチについてもVagrantfileに設定済みです。
node04がそれに当たります。

ベンチの使い方に関しては以下を参照してください。  
[isucon/isucon7-qualify](https://github.com/isucon/isucon7-qualify) 
