# puyo-game プロジェクト指示

ぷよぷよ風ゲーム（単一HTML / Canvas / Web Audio）。

## 最重要ルール：更新は必ず公開版にも反映する

このプロジェクトでコードを変更したら、**毎回かならず公開版（GitHub Pages）にも更新をかけること**。
ローカルの編集だけで終わらせない。変更 → 公開反映までを1セットとする。

```bash
bash /Users/koganaoto/Downloads/puyo-game/deploy.sh "変更内容のコミットメッセージ"
```

公開URL: https://naoto3815.github.io/PuyoPuyo/

## 編集対象ファイル（取り違え注意）

- **本当の編集元は `/Users/koganaoto/Downloads/puyo.html`**（リポジトリ外）。
- `deploy.sh` がこれを `puyo-game/index.html` にコピーして公開する。
- リポジトリ内の `index.html` だけを直接編集しても、`deploy.sh` 実行時に `puyo.html` で上書きされて消える。
  → コード変更は `puyo.html` に対して行う（両ファイルを一致させる）。

## 音声（連鎖ボイス）

- 連鎖ボイスmp3は `/Users/koganaoto/Downloads/voice/0.mp3〜6.mp3`。`deploy.sh` が `puyo-game/voice/` に同期して公開する。
- 生成方法は `generating-voicevox-voice` スキル（VOICEVOX無料API）。
- ライセンス上、使用話者のクレジット表記（例 `VOICEVOX:ずんだもん`）を必ずアプリ内に表示する。

## デプロイ前の確認

- `<script>` 内のJS構文チェック（`new Function(code)` 等）を通してから `deploy.sh` する。
