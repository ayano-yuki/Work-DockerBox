use wasm_bindgen::prelude::*;

// JavaScriptから呼べる関数
#[wasm_bindgen]
pub fn greet(name: &str) -> String {
    format!("Hello, {}!", name)
}