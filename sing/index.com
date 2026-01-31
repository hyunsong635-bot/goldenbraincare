<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>황금 건강 노래방</title>

<style>
:root{
  --bg:#f7f1da;
  --card:#ffffff;
  --gold:#c48a2c;
  --gold-dark:#9b6a1f;
  --brown:#4a2c16;
  --line:#eadfc1;
}

*{box-sizing:border-box}
body{
  margin:0;
  font-family: "Noto Sans KR", system-ui;
  background: radial-gradient(circle at top, #fffbe8, var(--bg));
  color:#2b1a0f;
}

/* HEADER */
header{
  display:flex;
  justify-content:space-between;
  align-items:center;
  padding:18px 28px;
}
header h1{
  margin:0;
  font-size:22px;
  font-weight:800;
}
header small{
  display:block;
  font-size:11px;
  letter-spacing:.18em;
  color:#9a7a4a;
}

.secure{
  background:#e35b65;
  color:white;
  padding:8px 14px;
  border-radius:999px;
  font-size:12px;
}

/* LAYOUT */
.main{
  display:grid;
  grid-template-columns: 1.7fr .9fr;
  gap:22px;
  padding:0 28px 40px;
}
.card{
  background:var(--card);
  border-radius:36px;
  padding:28px;
  border:1px solid var(--line);
}

/* SONG SELECT */
.song-grid{
  display:grid;
  grid-template-columns: repeat(3,1fr);
  gap:18px;
}
.song{
  border:2px solid #f0e6c8;
  border-radius:22px;
  padding:20px;
  cursor:pointer;
  transition:.2s;
}
.song:hover{
  border-color:var(--gold);
}
.song .tag{
  display:inline-block;
  background:#fff4d6;
  padding:6px 10px;
  border-radius:999px;
  font-size:12px;
  color:#9a6b1e;
}
.song h3{
  margin:14px 0 6px;
}
.song small{
  color:#9a6b1e;
  font-size:12px;
}

/* CAMERA */
.camera-wrap{
  position:relative;
  border-radius:28px;
  overflow:hidden;
}
video{
  width:100%;
  transform: scaleX(-1);
}
.face-ring{
  position:absolute;
  inset:20% 32%;
  border:2px dashed #e3c56f;
  border-radius:50%;
}
.timer{
  position:absolute;
  top:16px;
  right:16px;
  background:#c57d2d;
  color:white;
  padding:10px 16px;
  border-radius:999px;
  font-weight:800;
}
.db{
  position:absolute;
  top:16px;
  left:16px;
  background:black;
  color:#ffd84d;
  padding:8px 14px;
  border-radius:999px;
  font-size:13px;
}

/* LYRIC */
.lyric{
  margin-top:18px;
  background:#111;
  color:#777;
  padding:18px;
  border-radius:999px;
  font-size:20px;
  text-align:center;
}
.lyric span{
  color:#ffd84d;
  font-weight:800;
}

/* WAVE */
.wave{
  margin:30px auto 0;
  display:flex;
  justify-content:center;
  gap:6px;
}
.bar{
  width:8px;
  height:20px;
  background:linear-gradient(#ffd84d,#c57d2d);
  border-radius:6px;
  animation:wave 1s infinite ease-in-out;
}
.bar:nth-child(2){animation-delay:.1s}
.bar:nth-child(3){animation-delay:.2s}
.bar:nth-child(4){animation-delay:.3s}

@keyframes wave{
  0%,100%{height:14px}
  50%{height:34px}
}
</style>
</head>

<body>

<header>
  <div>
    <h1>황금 건강 노래방</h1>
    <small>NEUROLOGICAL VITAL MONITORING ENGINE v4.5</small>
  </div>
  <div class="secure">CONFIDENTIAL & SECURE</div>
</header>

<section class="main">

<!-- LEFT -->
<div class="card" id="select">
  <h2>🎵 단계별 노래를 골라보세요</h2>
  <div class="song-grid">
    <div class="song" onclick="startSong('아리랑')">
      <span class="tag">1단계 · 기초</span>
      <h3>아리랑</h3>
      <small>발성 안정성 · 호흡</small>
    </div>
    <div class="song" onclick="startSong('애국가')">
      <span class="tag">1단계 · 기초</span>
      <h3>애국가</h3>
      <small>음정 정확도 · 발성</small>
    </div>
  </div>
</div>

<div class="card" id="camera" style="display:none;">
