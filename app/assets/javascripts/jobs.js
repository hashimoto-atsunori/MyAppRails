 document.addEventListener('turbolinks:load', function() {

const timer = document.getElementById("timer");
const start = document.getElementById("start");
const stop = document.getElementById("stop");

// 経過時間を保存する変数（単位:ミリ秒）
let elapsedTime;
// スタートボタンを押したときのUnix Epoch
let startTime;
// タイマーのID
let timerId;
// 以前 stop したタイミングまでの計測時間
let timeToAdd = 0;

// 表示される内容をアップデートする関数
const updateTimeText = () => {
  // 1時間 = 1000 ミリ秒 * 60秒 * 60分
  let h = Math.floor(elapsedTime / (1000 * 60 * 60));
  // 1分 = 1000 ミリ秒 * 60秒
  let m = Math.floor(elapsedTime / (1000 * 60));
  // 1分に満たなかったミリ秒のうち，秒となったもの
  let s = Math.floor((elapsedTime % (1000 * 60)) / 1000);
  // 1秒になれなかったもの
  let ms = elapsedTime % 1000;

  // ゼロパディング
  m = `0${m}`.slice(-2);
  s = `0${s}`.slice(-2);
  ms = `00${ms}`.slice(-3);

  timer.value = `${h}:${m}:${s}`;
};

// 経過時間の管理と計算を行う関数
const countUp = () => {
  timerId = setTimeout(() => {
    elapsedTime = Date.now() - startTime + timeToAdd;
    updateTimeText();
    countUp();
  }, 10);
};

start.addEventListener("click", () => {
  startTime = Date.now();
  countUp();
  // スタートボタンを無効化
  start.disabled = true;
  // ストップボタンを有効化
  stop.disabled = false;
    });

//ダッシュボードの処理を追加
var elems = document.querySelectorAll('.sidenav');
var instances = M.Sidenav.init(elems, {});

 });
