# AtCoder Contest Folder Setup Script

このスクリプトは、AtCoder Beginner Contest (ABC) 用のフォルダを作成し、テンプレートをコピーするためのものです。

## 注意事項
- 実行は `atcoder` フォルダ内でのみ行えます。（`atcoder` フォルダは任意の場所に配置可能です）
- `atcoder` フォルダの名前は変更可能ですが、`atcoder` 内のファイルやフォルダ名を変更するとスクリプトが正しく動作しなくなります。
- その場合は、適宜 `copy_template.sh` を修正してください。

## 🌟1. プロファイルに追加して使用する方法

### Windows PowerShell のプロファイルを設定する
PowerShell のプロファイルに `atcoder` コマンドを追加することで、簡単にスクリプトを実行できるようになります。

### 手順 1: プロファイルに関数を追加する
PowerShell で以下のコマンドを実行してください。

```powershell
Add-Content $PROFILE 'function atcoder {
    param(
        [string]$subcmd,
        [Parameter(ValueFromRemainingArguments=$true)]
        [string[]]$args
    )
    if ($subcmd -eq "create") {
        bash.exe /path/to/your/atcoder/copy_template.sh $args
    } else {
        Write-Output "Usage: atcoder create"
    }
}'
```
※ `/path/to/your/` は各自の環境に応じたパスに変更してください。

### 手順 2: プロファイルを再読み込み
```powershell
. $PROFILE
```

### 手順 3: `atcoder create` コマンドを実行する
#### 土曜日（コンテスト当日）に作成する場合
```powershell
atcoder create
```

#### 土曜日以外の曜日でも作成する場合（強制作成）
```powershell
atcoder create -f
```
または
```powershell
atcoder create --force
```

この設定を行うことで、`atcoder create` コマンドを**どこでも簡単に**実行できるようになります！

---

## 2. プロファイルに追加しない場合の実行方法

### Windows での実行手順
#### 手順 1: WSL でスクリプトを直接実行する
```powershell
wsl bash /path/to/your/atcoder/copy_template.sh
```
※ `/path/to/your/` は各自の環境に応じたパスに変更してください。

#### 手順 2: `-f` オプションを使って強制作成
```powershell
wsl bash /path/to/your/atcoder/copy_template.sh -f
```
※ `/path/to/your/` は各自の環境に応じたパスに変更してください。

この方法では、PowerShell から WSL の `bash` を直接呼び出してスクリプトを実行します。
