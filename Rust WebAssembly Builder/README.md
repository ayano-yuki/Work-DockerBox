# Rust WebAssembly Build with Docker

このプロジェクトは **Rust** を **WebAssembly (WASM)** にビルドし、ブラウザで利用できるJavaScriptバインディングを生成する環境です。

Dockerを利用して環境構築・ビルドを自動化しています。

---

## 📂 プロジェクト構造
```bash
<project-root>/
├── Cargo.toml
├── Cargo.lock (初回はなくてもOK)
├── src/
│ └── lib.rs
├── Dockerfile
├── build_wasm.bat
└── (ビルド後に生成)
└── pkg/
├── your_project_bg.wasm
├── your_project.js
├── your_project.d.ts
└── package.json
```


---

## 🚀 ビルド手順

1. **Docker Desktopを起動**
    Dockerがインストールされ、起動していることを確認してください。

2. **`build_wasm.bat` を実行**
    プロジェクトルートでダブルクリックするか、PowerShell/コマンドプロンプトで以下を実行します。
    ```bash
    build_wasm.bat
    ```
以下の処理が行われます:

- Dockerイメージをビルド
- 一時コンテナを作成
- `pkg/` フォルダをホストにコピー
- 一時コンテナを削除

3. **成果物確認**
ビルド成功後、プロジェクトルートに `pkg/` フォルダが作成されます。
中に以下のファイルが生成されます。
- `your_project_bg.wasm`（WebAssemblyバイナリ）
- `your_project.js`（JSバインディング）
- `your_project.d.ts`（TypeScript型定義）
- `package.json`（モジュール定義）

---

## 🧩 ブラウザでの利用例
以下はHTML + JavaScriptで読み込む例です。
```html
<script type="module">
import init, { greet } from "./pkg/your_project.js";

async function run() {
 await init();
 const msg = greet("Rust");
 console.log(msg);
}

run();
</script>
```

## ⚠️ 注意
- Cargo.toml には次の設定が必要です:
    ```toml
    [lib]
    crate-type = ["cdylib"]

    [dependencies]
    wasm-bindgen = "0.2"
    ```

- ソースコード (src/lib.rs) は以下のように #[wasm_bindgen] 属性を付けます:
    ```rust
    use wasm_bindgen::prelude::*;

    #[wasm_bindgen]
    pub fn greet(name: &str) -> String {
        format!("Hello, {}!", name)
    }
    ```

- wasm-bindgen を使わないとブラウザで正しく動きません。

## 🔧 カスタマイズ
- Node.js用ビルド:
    Dockerfileの wasm-pack build を以下に変更:
    ```bash
    RUN wasm-pack build --release --target nodejs
    ```
- NPMパッケージ公開:
    pkg/フォルダをそのまま npm publish 可能です。