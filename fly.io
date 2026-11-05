<!DOCTYPE html>
<html lang="it">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
<title>Fly.io – Arena dei moscerini</title>
<style>
:root{--bg:#e9eee8;--fg:#1b241f;--mut:#667068;--card:#f7faf6;--bd:#cdd6cc;--ac:#b4231a;box-sizing:border-box;padding-top:env(safe-area-inset-top,0px);padding-bottom:env(safe-area-inset-bottom,0px)}
@media (prefers-color-scheme:dark){:root:not([data-theme="light"]){--bg:#0a100d;--fg:#e4ece6;--mut:#8b998f;--card:#131c17;--bd:#26342b;--ac:#ff5a4d}}
:root[data-theme="dark"]{--bg:#0a100d;--fg:#e4ece6;--mut:#8b998f;--card:#131c17;--bd:#26342b;--ac:#ff5a4d}
html,body{height:100%;margin:0}
body{background:var(--bg);color:var(--fg);font:13px/1.35 system-ui,-apple-system,"Segoe UI",sans-serif}
#app{--lw:176px;--rw:176px;height:100%;display:grid;grid-template-columns:var(--lw) minmax(0,1fr) var(--rw);gap:8px;padding:8px;box-sizing:border-box}
.p{background:var(--card);border:1px solid var(--bd);border-radius:10px;padding:10px;overflow:auto;min-height:0}
.p h2{font-size:13px;margin:10px 0 6px;font-weight:700}
.p h2:first-child{margin-top:0}
#stage{position:relative;min-height:0;border-radius:10px;overflow:hidden;background:#0c1511}
#c{width:100%;height:100%;display:block;touch-action:none;cursor:crosshair}
#hud{position:absolute;left:10px;top:10px;right:10px;display:flex;flex-wrap:wrap;gap:6px;align-items:center;pointer-events:none;color:#e4ece6}
#hud b{font-size:15px;margin-right:4px}
#msg{margin-left:auto;color:#ff8a80;font-weight:700}
button,input{font:inherit;color:inherit}
button{pointer-events:auto;background:#1d2b23;border:1px solid #3a4f42;color:#e4ece6;border-radius:8px;padding:5px 10px;cursor:pointer}
button:focus-visible,input:focus-visible{outline:2px solid var(--ac);outline-offset:1px}
input{width:100%;box-sizing:border-box;background:transparent;border:1px solid var(--bd);border-radius:8px;padding:5px 8px}
.small{color:var(--mut);font-size:12px;margin:4px 0}
.row{display:flex;justify-content:space-between;gap:6px;padding:3px 4px;border-radius:6px}
.row span:last-child{font-variant-numeric:tabular-nums;color:var(--mut)}
.row.me{background:color-mix(in srgb,var(--ac) 18%,transparent);font-weight:700}
@media (max-width:700px){#app{--lw:104px;--rw:104px;gap:4px;padding:4px}.p{padding:6px;font-size:11px}#hud b{font-size:12px}}
.two{flex-direction:row!important}.two button{flex:1}
[hidden]{display:none!important}
button[aria-pressed="true"]{background:var(--ac);border-color:var(--ac)}
#lobby{position:fixed;inset:0;z-index:10;background:var(--bg);display:flex;align-items:center;justify-content:center;padding:calc(16px + env(safe-area-inset-top,0px)) 16px calc(16px + env(safe-area-inset-bottom,0px));box-sizing:border-box;overflow:auto}
.lc{max-width:360px;width:100%;display:flex;flex-direction:column;gap:10px}
.lc>div{display:flex;flex-direction:column;gap:8px}
.big{padding:12px;font-size:15px}
#code{font-size:34px;letter-spacing:.2em;font-weight:700;text-align:center}
#lerr{color:var(--ac)}
.zp{position:absolute;left:10px;top:52px;background:#131c17;color:#e4ece6;border:1px solid #3a4f42;border-radius:10px;padding:10px;display:flex;flex-direction:column;gap:6px;width:150px}
.zp input{color:#e4ece6;border-color:#3a4f42;margin:0}
#app.hl{--lw:0px}#app.hr{--rw:0px}
#app.hl>aside:first-child,#app.hr>aside:last-child{padding:0;border-width:0;visibility:hidden;min-width:0}
#tg{position:absolute;left:8px;right:8px;bottom:8px;display:flex;justify-content:space-between;pointer-events:none}
#tg button{padding:6px 12px;font-size:16px}
#hud.off button{display:none}

.p{background:color-mix(in srgb,var(--card) 94%,transparent);border-radius:14px;box-shadow:0 6px 24px rgba(0,0,0,.16)}
.p h2{font-size:11px;letter-spacing:.09em;text-transform:uppercase;color:var(--mut);margin:14px 0 6px}
.p h2:first-child{margin-top:0}
.small{line-height:1.55}
input{border-radius:10px;padding:8px 10px;background:color-mix(in srgb,var(--fg) 5%,transparent)}
.row{padding:5px 8px;border-radius:8px}
.row:nth-child(odd){background:color-mix(in srgb,var(--fg) 4%,transparent)}
.row i{font-style:normal;display:inline-block;width:18px;color:var(--mut);font-size:11px}
.row.me{background:linear-gradient(90deg,color-mix(in srgb,var(--ac) 30%,transparent),transparent)}
#stage{border-radius:14px;box-shadow:0 6px 24px rgba(0,0,0,.28);background:#050c08}
button{border-radius:999px;padding:7px 14px;background:rgba(8,18,12,.72);border:1px solid rgba(255,255,255,.16);backdrop-filter:blur(6px);-webkit-backdrop-filter:blur(6px);transition:background .15s,transform .1s}
button:hover{background:rgba(40,74,54,.88)}
button:active{transform:scale(.96)}
#hud b{background:rgba(8,18,12,.72);border:1px solid rgba(255,255,255,.16);border-radius:999px;padding:6px 14px;backdrop-filter:blur(6px);-webkit-backdrop-filter:blur(6px);margin-right:2px}
#hud{gap:8px}
#tg button{width:42px;height:42px;padding:0;display:grid;place-items:center}
.zp{border-radius:14px;box-shadow:0 10px 30px rgba(0,0,0,.4);backdrop-filter:blur(8px)}
#lobby{background:radial-gradient(1000px 600px at 50% -10%,color-mix(in srgb,var(--ac) 24%,var(--bg)),var(--bg))}
.lc{background:var(--card);border:1px solid var(--bd);border-radius:22px;padding:24px;box-shadow:0 24px 70px rgba(0,0,0,.3)}
.logo{font-size:36px;margin:0;letter-spacing:-.03em;font-weight:800}
.logo span{color:var(--ac)}
.lc button:not(.big){background:transparent;color:var(--fg);border:1px solid var(--bd);backdrop-filter:none}
.lc button:not(.big):hover{background:color-mix(in srgb,var(--fg) 7%,transparent)}
.lc .big{background:var(--ac);border:none;color:#fff;font-weight:700;border-radius:14px;backdrop-filter:none}
.lc .big:hover{filter:brightness(1.1);background:var(--ac)}
.lc #bj0{background:transparent;color:var(--fg);border:1px solid var(--bd)}
.lc button[aria-pressed="true"]{background:var(--ac);color:#fff;border-color:var(--ac)}
#code{background:color-mix(in srgb,var(--fg) 5%,transparent);border:1px dashed var(--bd);border-radius:14px;padding:12px}
#tm{position:absolute;bottom:58px;left:50%;transform:translateX(-50%);background:rgba(8,18,12,.72);border:1px solid rgba(255,255,255,.16);border-radius:999px;padding:6px 14px;color:#e4ece6;pointer-events:none;white-space:nowrap;font-size:13px;backdrop-filter:blur(6px)}
#end{position:fixed;inset:0;z-index:11;display:flex;align-items:center;justify-content:center;padding:16px;box-sizing:border-box;background:rgba(5,12,8,.78);backdrop-filter:blur(6px)}
#wd{position:fixed;inset:0;z-index:12;display:flex;padding:16px;box-sizing:border-box;background:rgba(5,12,8,.78);backdrop-filter:blur(6px);-webkit-backdrop-filter:blur(6px);overflow:auto}
#wd>.lc{margin:auto;max-width:400px}
#wp{width:100%;aspect-ratio:3/2;background:#0c1511;border-radius:14px;display:block}
#wt button{padding:7px 4px;font-size:12px}
.lc>#wo{display:grid;grid-template-columns:repeat(auto-fill,minmax(72px,1fr));gap:6px;max-height:216px;overflow:auto}
.opt{display:flex;flex-direction:column;align-items:center;gap:3px;padding:5px 4px!important;border-radius:14px!important;font-size:11px}
.opt canvas{width:56px;height:56px;background:#0c1511;border-radius:10px}
.lc button[aria-pressed="true"]{color:#fff}
.lc button[aria-pressed="true"]:not(.big):hover{background:var(--ac);color:#fff}
#hud #pw1{color:#ffc933;border-color:rgba(255,201,51,.55)}
#hud #pw2{color:#4fe3ff;border-color:rgba(79,227,255,.55)}
</style>
</head>
<body>
<div id="app">
  <aside class="p">
    <h2>La tua mosca</h2>
    <input id="nm" value="Tu" maxlength="14" aria-label="Il tuo nome">
    <h2>Comandi</h2>
    <p class="small">W A S D, mouse o dito: muovi.<br>T: ti dividi in due.<br>Y: lanci un po’ di massa.<br>M: mappa intera.<br>Mangi chi ha anche solo 1 di massa meno di te.</p><h2>Power-up</h2><p class="small"><b style="color:#e8a400">Sfera dorata ×2</b>: doppio cibo per 1 minuto.<br><b style="color:#12a8c4">Fulmine azzurro</b>: turbo ×4 per 15 secondi.</p>
    <h2>🏆 Più grandi</h2>
    <div id="lb"></div>
  </aside>
  <main id="stage">
    <canvas id="c"></canvas>
    <div id="hud"><b id="ms">Massa 10</b><b id="pw1" hidden></b><b id="pw2" hidden></b><button id="map" type="button">Mappa intera</button><button id="sp" type="button">Dividi (T)</button><button id="ej" type="button">Espelli (Y)</button><button id="wb" type="button">Look</button><span id="msg"></span></div>
  <div id="tm" hidden></div><div id="tg"><button id="tl" type="button" aria-label="Mostra o nascondi il pannello a sinistra">◧</button><button id="th" type="button" aria-label="Mostra o nascondi i comandi">⋯</button><button id="tr" type="button" aria-label="Mostra o nascondi il pannello a destra">◨</button></div><div id="zp" class="zp" hidden><label for="zv">Grandezza</label><input id="zv" type="number" min="10" max="5000" inputmode="numeric"><button id="zok" type="button">Applica</button><button id="zx" type="button">Chiudi</button></div></main>
  <aside class="p">
    <h2>💀 Morti</h2>
    <div id="dl"></div>
  </aside>
</div>
<div id="wd" hidden><div class="lc"><h1 class="logo" style="font-size:26px">La tua <span>mosca</span></h1><canvas id="wp" width="300" height="200"></canvas><div class="two" id="wt"></div><div id="wo"></div><button class="big" id="wx" type="button">Fatto</button></div></div>
<div id="end" hidden><div class="lc"><h1 class="logo" id="et"></h1><p id="ed"></p><button class="big" id="er" type="button">Torna alla schermata iniziale</button></div></div><div id="lobby"><div class="lc">
<h1 class="logo">Fly<span>.io</span> 🪰</h1><p class="small" style="margin:0">L’arena dei moscerini</p>
<input id="lnm" value="Tu" maxlength="14" aria-label="Il tuo nome">
<div id="l0"><button class="big" id="bc0" type="button">Crea stanza</button><button class="big" id="bj0" type="button">Unisciti a una stanza</button><button id="bwd" type="button">Personalizza mosca</button></div>
<div id="l1" hidden><p>Vuoi i bot nella stanza?</p><div class="two"><button id="bs" type="button" aria-pressed="true">Sì</button><button id="bn" type="button" aria-pressed="false">No</button></div><p>Modalità di gioco</p><div class="two"><button id="mf" type="button" aria-pressed="true">Libera</button><button id="mt" type="button" aria-pressed="false">Squadre</button></div><button class="big" id="bf" type="button">Fatto</button><button id="bb1" type="button">Indietro</button></div>
<div id="l2" hidden><input id="jc" placeholder="Codice stanza" maxlength="8" autocomplete="off" aria-label="Codice stanza"><button class="big" id="bj" type="button">Unisciti</button><button id="bb2" type="button">Indietro</button></div>
<div id="l3" hidden><p class="small">Codice della stanza</p><div id="code"></div><div id="plist"></div><button id="bsw" type="button" hidden>Cambia squadra</button><button class="big" id="bst" type="button">Inizia gioco</button><p id="wait" class="small"></p></div>
<p id="lerr" class="small"></p>
</div></div>
<script src="https://cdn.jsdelivr.net/npm/peerjs@1.5.4/dist/peerjs.min.js"></script>
<script>
const WORLD=3000,C=document.getElementById('c'),X=C.getContext('2d');
let w=1,h=1,dpr=1,full=false,mx=0,my=0,toast=0,scl=.8,T=0,playing=false,room=null,iHost=false,myPeer=null,pt=0,bots=true;const G={},seenG={},ro={};const cam={x:1500,y:1500};
function rs(){dpr=devicePixelRatio||1;const r=C.getBoundingClientRect();w=r.width;h=r.height;C.width=w*dpr;C.height=h*dpr}
addEventListener('resize',rs);
if(typeof ResizeObserver!=='undefined')new ResizeObserver(rs).observe(C);
const rnd=(a,b)=>a+Math.random()*(b-a),clamp=(v,a,b)=>Math.max(a,Math.min(b,v)),rad=m=>4+Math.sqrt(m)*2.6;
const NAMES=['Zzzap','Drosofila','Bzzt','Moscerino','Pungiglione','Ronzio','Mosca Rossa','Dottor Bzz','Frullo','Vola-Vola','Occhirossi','Ali di Seta','Fruttina','Aristotele','Gigi'];
const owners=[],cells=[];let seed=1,roomCode='',creating=false;let teams=false,tmode=false,myT=-1,KB=[0,0],lastHit=-1,over=false,t0=0;const TK={};const elog=[];
const strHash=t=>{let q=7;for(const ch of t)q=(Math.imul(q,31)+ch.charCodeAt(0))|0;return q};
const hsh=(a,b)=>{let t=(Math.imul(a,374761393)+Math.imul(b,668265263)+seed)|0;t=Math.imul(t^(t>>>13),1274126177);t=Math.imul(t^(t>>>16),2246822519);return((t^(t>>>15))>>>0)/4294967296};
const foodAt=(i,v)=>({x:20+hsh(i*3,v)*(WORLD-40),y:20+hsh(i*3+1,v)*(WORLD-40),c:Math.floor(hsh(i*3+2,v)*360),m:1,vx:0,vy:0,i,v});
const mkFood=()=>Array.from({length:520},(_,i)=>foodAt(i,0));
let food=mkFood();
function newCell(o,x,y,m){const c={o,x,y,m,vx:0,vy:0,bx:0,by:0,mt:0,ang:rnd(0,6.28),ph:rnd(0,6)};cells.push(c);return c}
function spawn(o){newCell(o,rnd(100,WORLD-100),rnd(100,WORLD-100),10);o.dead=0}
function mk(name,bot){const o={id:owners.length,name,bot,deaths:0,dead:0,hue:bot?Math.floor(rnd(15,70)):50,wx:0,wy:0};owners.push(o);spawn(o);return o}
let me={id:-1,name:'Tu',deaths:0};
const mine=()=>cells.filter(c=>c.o===me);
function wm(){return{x:cam.x+(mx-w/2)/scl,y:cam.y+(my-h/2)/scl}}
const keys={};let kb=false;
function aim(c){if(kb)return[Math.cos(c.ang),Math.sin(c.ang)];const m=wm(),dx=m.x-c.x,dy=m.y-c.y,l=Math.hypot(dx,dy)||1;return[dx/l,dy/l]}
function nearCell(c,t){let b=null,bd=500;for(const k of cells){if(!t(k))continue;const d=Math.hypot(k.x-c.x,k.y-c.y);if(d<bd){bd=d;b=k}}return b?{dx:(b.x-c.x)/bd,dy:(b.y-c.y)/bd,p:1-bd/500}:{dx:0,dy:0,p:0}}
function nearFood(c){let b=null,bd=400;for(const f of food){const d=Math.hypot(f.x-c.x,f.y-c.y);if(d<bd){bd=d;b=f}}return b?{dx:(b.x-c.x)/bd,dy:(b.y-c.y)/bd,p:1-bd/400}:{dx:0,dy:0,p:0}}
function split(){for(const c of mine()){if(c.m<20||mine().length>=8)continue;const[dx,dy]=aim(c),l=1;c.m/=2;c.mt=12;const n=newCell(me,c.x,c.y,c.m);n.mt=12;n.bx=dx/l*700;n.by=dy/l*700;n.ang=c.ang}}
function eject(){for(const c of mine()){if(c.m<14)continue;const[dx,dy]=aim(c),l=1;c.m-=2;const r=rad(c.m)*1.25+10;food.push({x:c.x+dx/l*r,y:c.y+dy/l*r,c:50,m:1.5,e:1,vx:dx/l*600,vy:dy/l*600})}}
function step(dt){
  for(const o of owners)if(o.dead>0){o.dead-=dt;if(o.dead<=0)spawn(o)}
  const ws=wm();
  for(const c of cells){
    if(c.r){const ddx=c.px-c.x,ddy=c.py-c.y,k=Math.min(1,dt*12);if(Math.abs(ddx)+Math.abs(ddy)>3)c.ang=Math.atan2(ddy,ddx);c.x+=ddx*k;c.y+=ddy*k;continue}const o=c.o;let tx=0,ty=0;const sp=260*Math.pow(c.m,-.18)*(c.o===me&&pw.tb>0?4:1);
    if(o.bot){
      const fd=nearFood(c),pr=nearCell(c,k=>k.o!==o&&k.m+1<=c.m),th=nearCell(c,k=>k.o!==o&&k.m>=c.m+1);
      o.wx=(o.wx+rnd(-.2,.2))*.97;o.wy=(o.wy+rnd(-.2,.2))*.97;
      tx=fd.dx*fd.p*.7+pr.dx*pr.p*1.2-th.dx*th.p*1.8+o.wx;ty=fd.dy*fd.p*.7+pr.dy*pr.p*1.2-th.dy*th.p*1.8+o.wy;
      if(c.x<150)tx+=1;if(c.x>WORLD-150)tx-=1;if(c.y<150)ty+=1;if(c.y>WORLD-150)ty-=1;
      const l=Math.hypot(tx,ty)||1;tx/=l;ty/=l;
    }else{
      const kx=(keys.d?1:0)-(keys.a?1:0),ky=(keys.s?1:0)-(keys.w?1:0),kl=Math.hypot(kx,ky);if(kb&&kl){tx=kx/kl;ty=ky/kl}const dx=ws.x-c.x,dy=ws.y-c.y,l=kb?0:Math.hypot(dx,dy);
      if(l>1){const k=Math.min(1,l*scl/60);tx=dx/l*k;ty=dy/l*k}
    }
    c.vx+=(tx*sp-c.vx)*Math.min(1,dt*5);c.vy+=(ty*sp-c.vy)*Math.min(1,dt*5);
    c.x=clamp(c.x+(c.vx+c.bx)*dt,0,WORLD);c.y=clamp(c.y+(c.vy+c.by)*dt,0,WORLD);
    const bd=Math.pow(.015,dt);c.bx*=bd;c.by*=bd;c.mt-=dt;
    if(Math.hypot(c.vx,c.vy)>10)c.ang=Math.atan2(c.vy,c.vx);
    const r=rad(c.m)*(o===me?1.25:1);
    for(let i=food.length-1;i>=0;i--){const f=food[i];if(Math.abs(f.x-c.x)<r&&Math.abs(f.y-c.y)<r&&Math.hypot(f.x-c.x,f.y-c.y)<r){c.m+=f.m*(o===me&&pw.x2>0?2:1);if(f.e)food.splice(i,1);else{f.v++;Object.assign(f,foodAt(f.i,f.v));elog.push([f.i,f.v]);if(elog.length>50)elog.shift()}}}
    
  }
  puStep(dt);
  for(const f of food)if(f.vx||f.vy){f.x=clamp(f.x+f.vx*dt,0,WORLD);f.y=clamp(f.y+f.vy*dt,0,WORLD);const k=Math.pow(.02,dt);f.vx*=k;f.vy*=k;if(Math.abs(f.vx)+Math.abs(f.vy)<2)f.vx=f.vy=0}
  const gone=new Set();
  for(const a of cells){if(gone.has(a))continue;for(const b of cells){if(a===b||gone.has(b))continue;const d=Math.hypot(a.x-b.x,a.y-b.y);
    if(a.o===b.o){if(!a.r&&a.mt<=0&&b.mt<=0&&a.m>=b.m&&d<rad(a.m)*.6){a.m+=b.m;gone.add(b)}}
    else if(a.m>=b.m+1&&d<rad(a.m)&&!(teams&&a.o.t!==undefined&&a.o.t===b.o.t)){if(a.r&&!b.r){gone.add(b);if(a.pe)G[a.pe]=(G[a.pe]||0)+b.m*.8;if(a.pe&&b.o===me)lastHit=a.o.t===0||a.o.t===1?a.o.t:-1}else if(!a.r&&!b.r){a.m+=b.m*.8;gone.add(b)}}}}
  for(let i=cells.length-1;i>=0;i--)if(gone.has(cells[i]))cells.splice(i,1);
  for(const o of owners)if(o.dead<=0&&!cells.some(c=>c.o===o)){o.deaths++;o.dead=1.6;if(o===me){if(teams&&(lastHit===0||lastHit===1)&&lastHit!==me.t)KB[lastHit]++;lastHit=-1;toast=1.6;document.getElementById('msg').textContent='Mangiata! Rinasci…'}}
  if(toast>0){toast-=dt;if(toast<=0)document.getElementById('msg').textContent=''}
}
const BG=document.createElement('canvas');BG.width=BG.height=1500;
(function(){const g=BG.getContext('2d');let sd=7;const r=()=>(sd=(sd*16807)%2147483647)/2147483647;
  const gr=g.createRadialGradient(750,750,100,750,750,1100);gr.addColorStop(0,'#17402c');gr.addColorStop(.7,'#0f2a1e');gr.addColorStop(1,'#08160f');g.fillStyle=gr;g.fillRect(0,0,1500,1500);
  g.fillStyle='rgba(160,230,190,.07)';for(let y=37;y<1500;y+=75)for(let x=((y/75|0)%2)*37+37;x<1500;x+=75){g.beginPath();g.arc(x,y,2.2,0,6.28);g.fill()}
  for(let i=0;i<46;i++){const x=r()*1500,y=r()*1500,rr=18+r()*55,hh=[8,28,48,100,130,340][i%6],q=g.createRadialGradient(x,y,0,x,y,rr);q.addColorStop(0,`hsla(${hh},60%,50%,.16)`);q.addColorStop(1,`hsla(${hh},60%,50%,0)`);g.fillStyle=q;g.beginPath();g.arc(x,y,rr,0,6.28);g.fill()}
  for(let i=0;i<60;i++){const x=r()*1500,y=r()*1500,an=r()*6.28,l=20+r()*30;g.save();g.translate(x,y);g.rotate(an);g.fillStyle=`hsla(${120+r()*40},45%,${22+r()*10}%,.35)`;g.beginPath();g.ellipse(0,0,l,l*.4,0,0,6.28);g.fill();g.strokeStyle='rgba(180,240,200,.12)';g.lineWidth=1.2;g.beginPath();g.moveTo(-l,0);g.lineTo(l,0);g.stroke();g.restore()}
})();
const X0=X;
const HUES=[50,5,215,130,280,330,20,170,95,250,310],COLN=['Auto','Rosso','Blu','Verde','Viola','Rosa','Arancio','Turchese','Lime','Indaco','Fucsia'];
const HATS=['Nessuno','Cilindro','Festa','Corona','Cowboy','Elica','Cuoco','Aureola','Natale','Pirata','Mago','Vichingo','Paglia','Gatto','Casco'],GLS=['Nessuno','Da sole','Tondi','Cuore','Maschera','3D','Monocolo','Stelle','Visore'],EXT=['Nessuno','Baffi','Farfallino','Mantello','Sciarpa','Cravatta','Collana','Ali','Fiore'];
const ZF=[0,0,0,0,0],NCOL=['#ffffff','#ffd24a','#ff6b5e','#6db4ff','#7dff9a','#ff8fd3','#c59bff','#ff9f43'],NCOLN=['Bianco','Giallo','Rosso','Blu','Verde','Rosa','Viola','Arancio'],LIM=[HATS.length,GLS.length,EXT.length,HUES.length,NCOL.length];
const cleanFit=a=>Array.isArray(a)?LIM.map((n,i)=>{const v=Math.floor(+a[i]);return v>=0&&v<n?v:0}):ZF;
const myFit=[0,0,0,0,0];try{cleanFit(JSON.parse(localStorage.getItem('flyio-fit'))).forEach((v,i)=>{myFit[i]=v})}catch(e){}
const pw={x2:0,tb:0};let pups=[];const plog=[];
const puAt=(i,v)=>({i,v,t:i%2?'tb':'x2',x:60+hsh(2000+i*2,v)*(WORLD-120),y:60+hsh(2001+i*2,v)*(WORLD-120)});
const mkPups=()=>Array.from({length:8},(_,k)=>puAt(k,0));
const flash=t=>{$('msg').textContent=t;toast=2};
function collect(p){if(p.t==='x2'){pw.x2=60;flash('Doppio cibo per 1 minuto!')}else{pw.tb=15;flash('Turbo ×4 per 15 secondi!')}const v=p.v+1;Object.assign(p,puAt(p.i,v));plog.push([p.i,v]);if(plog.length>12)plog.shift()}
function puStep(dt){
  if(me.dead>0){pw.x2=0;pw.tb=0}
  if(pw.x2>0)pw.x2=Math.max(0,pw.x2-dt);
  if(pw.tb>0)pw.tb=Math.max(0,pw.tb-dt);
  me.fx=[pw.x2>0?1:0,pw.tb>0?1:0];
  for(const c of cells){if(c.o!==me||c.r)continue;const r=rad(c.m)+24;for(const p of pups)if(Math.hypot(p.x-c.x,p.y-c.y)<r)collect(p)}
}
const fmt=t=>{t=Math.ceil(t);return Math.floor(t/60)+':'+String(t%60).padStart(2,'0')};
function pwHud(){const a=$('pw1'),b=$('pw2');a.hidden=!(pw.x2>0);b.hidden=!(pw.tb>0);if(!a.hidden)a.textContent='×2 Cibo '+fmt(pw.x2);if(!b.hidden)b.textContent='Turbo ×4 '+Math.ceil(pw.tb)+'s'}
function fxRing(X,o,c,r,s){const fx=o.fx;if(!fx||!(fx[0]||fx[1]))return;X.save();
  if(fx[1]){X.strokeStyle='rgba(60,230,255,.65)';X.lineWidth=r*.12;X.beginPath();X.arc(c.x,c.y,r*(1.35+Math.sin(T*18)*.06),0,6.28);X.stroke()}
  if(fx[0]){X.strokeStyle='rgba(255,196,40,.8)';X.lineWidth=r*.14;X.setLineDash([r*.5,r*.4]);X.lineDashOffset=-T*r*3;X.beginPath();X.arc(c.x,c.y,r*1.75,0,6.28);X.stroke()}
  X.restore()}
function fxBack(X,o,r){if(!o.fx||!o.fx[1])return;X.save();X.lineCap='round';X.strokeStyle='rgba(120,240,255,.75)';X.lineWidth=r*.07;const k0=Math.floor(T*25);for(let k=0;k<5;k++){const y=(k-2)*r*.38,len=r*(1.1+((k*7+k0)%3)*.55);X.beginPath();X.moveTo(-r*1.0,y);X.lineTo(-r*1.0-len,y);X.stroke()}X.restore()}
function drawPups(s,x0,x1,y0,y1){
  const X=X0;
  for(const p of pups){if(p.x<x0-80||p.x>x1+80||p.y<y0-80||p.y>y1+80)continue;
    const q=Math.max(22,13/s)*(1+Math.sin(T*4+p.i)*.08);
    X.save();X.translate(p.x,p.y);
    const g=X.createRadialGradient(0,0,q*.4,0,0,q*2.4);
    if(p.t==='x2'){
      g.addColorStop(0,'rgba(255,190,30,.6)');g.addColorStop(1,'rgba(255,190,30,0)');X.fillStyle=g;X.beginPath();X.arc(0,0,q*2.4,0,6.28);X.fill();
      X.save();X.rotate(T*.8);X.fillStyle='#ffb703';X.beginPath();for(let i=0;i<16;i++){const a=i*Math.PI/8,rr=i%2?q*.88:q*1.18;X.lineTo(Math.cos(a)*rr,Math.sin(a)*rr)}X.closePath();X.fill();X.restore();
      X.fillStyle='#fff3c4';X.beginPath();X.arc(0,0,q*.74,0,6.28);X.fill();
      X.fillStyle='#8a5200';X.font='800 '+(q*.95)+'px system-ui,sans-serif';X.textAlign='center';X.textBaseline='middle';X.fillText('×2',0,q*.05);
    }else{
      g.addColorStop(0,'rgba(60,230,255,.6)');g.addColorStop(1,'rgba(60,230,255,0)');X.fillStyle=g;X.beginPath();X.arc(0,0,q*2.4,0,6.28);X.fill();
      X.fillStyle='#0096c7';X.strokeStyle='#caf0f8';X.lineWidth=q*.12;X.lineJoin='round';X.beginPath();for(let i=0;i<6;i++){const a=i*Math.PI/3+Math.PI/6;X.lineTo(Math.cos(a)*q*1.12,Math.sin(a)*q*1.12)}X.closePath();X.fill();X.stroke();
      X.fillStyle='#fff';X.beginPath();for(const k of[[.14,-.8],[-.44,.1],[-.05,.1],[-.15,.82],[.44,-.14],[.06,-.14]])X.lineTo(k[0]*q,k[1]*q);X.closePath();X.fill();
    }
    X.restore()}
}
function star(X,x,y,R){X.beginPath();for(let i=0;i<10;i++){const a=-Math.PI/2+i*Math.PI/5,q=i%2?R*.45:R;X[i?'lineTo':'moveTo'](x+Math.cos(a)*q,y+Math.sin(a)*q)}X.closePath();X.fill();X.stroke()}
function heart(X,x,y,s){X.save();X.translate(x,y);X.rotate(Math.PI/2);X.beginPath();X.moveTo(0,s*.9);X.bezierCurveTo(-s*1.4,-s*.1,-s*.7,-s*1.1,0,-s*.4);X.bezierCurveTo(s*.7,-s*1.1,s*1.4,-s*.1,0,s*.9);X.fill();X.restore()}
function hat(X,k,u){
  X.save();X.lineJoin='round';
  if(k===1){X.fillStyle='#16181b';X.beginPath();X.ellipse(0,0,.64*u,.17*u,0,0,6.28);X.fill();X.fillRect(-.36*u,-.8*u,.72*u,.8*u);X.fillStyle='#2b2f34';X.beginPath();X.ellipse(0,-.8*u,.36*u,.1*u,0,0,6.28);X.fill();X.fillStyle='#c0392b';X.fillRect(-.36*u,-.26*u,.72*u,.15*u)}
  else if(k===2){X.fillStyle='#ff4fa3';X.beginPath();X.moveTo(-.38*u,0);X.lineTo(0,-.95*u);X.lineTo(.38*u,0);X.closePath();X.fill();X.fillStyle='#ffe066';for(const q of[[-.1,-.3],[.12,-.5],[-.02,-.68],[.2,-.18]]){X.beginPath();X.arc(q[0]*u,q[1]*u,.05*u,0,6.28);X.fill()}X.beginPath();X.arc(0,-.97*u,.1*u,0,6.28);X.fill()}
  else if(k===3){X.fillStyle='#f4c430';X.strokeStyle='#b8860b';X.lineWidth=.05*u;X.beginPath();X.moveTo(-.46*u,0);X.lineTo(-.46*u,-.52*u);X.lineTo(-.23*u,-.3*u);X.lineTo(0,-.66*u);X.lineTo(.23*u,-.3*u);X.lineTo(.46*u,-.52*u);X.lineTo(.46*u,0);X.closePath();X.fill();X.stroke();X.fillStyle='#e63946';for(const x of[-.46,0,.46]){X.beginPath();X.arc(x*u,(x?-.52:-.66)*u,.06*u,0,6.28);X.fill()}}
  else if(k===4){X.fillStyle='#8b5a2b';X.beginPath();X.ellipse(0,0,.88*u,.22*u,0,0,6.28);X.fill();X.fillStyle='#a56a37';X.beginPath();X.moveTo(-.34*u,0);X.lineTo(-.3*u,-.55*u);X.quadraticCurveTo(0,-.4*u,.3*u,-.55*u);X.lineTo(.34*u,0);X.closePath();X.fill();X.fillStyle='#5c3a1a';X.fillRect(-.34*u,-.16*u,.68*u,.1*u)}
  else if(k===5){X.fillStyle='#2e86de';X.beginPath();X.arc(0,0,.4*u,Math.PI,0);X.closePath();X.fill();X.fillStyle='#1b5fa8';X.fillRect(-.07*u,-.52*u,.14*u,.14*u);X.save();X.translate(0,-.5*u);X.rotate(T*20);X.fillStyle='#f5c542';X.beginPath();X.ellipse(.3*u,0,.3*u,.07*u,0,0,6.28);X.fill();X.beginPath();X.ellipse(-.3*u,0,.3*u,.07*u,0,0,6.28);X.fill();X.restore();X.fillStyle='#d62a1f';X.beginPath();X.arc(0,-.5*u,.07*u,0,6.28);X.fill()}
  else if(k===6){X.fillStyle='#f6f6f2';for(const q of[[-.26,-.58,.26],[.26,-.58,.26],[0,-.8,.3]]){X.beginPath();X.arc(q[0]*u,q[1]*u,q[2]*u,0,6.28);X.fill()}X.fillRect(-.34*u,-.55*u,.68*u,.55*u);X.fillStyle='#e0e0d8';X.fillRect(-.34*u,-.2*u,.68*u,.2*u)}
  else if(k===7){X.lineWidth=.16*u;X.strokeStyle='rgba(255,224,102,.3)';X.beginPath();X.ellipse(0,-.78*u,.42*u,.14*u,0,0,6.28);X.stroke();X.lineWidth=.08*u;X.strokeStyle='#ffe066';X.stroke()}
  else if(k===8){X.fillStyle='#d62a1f';X.beginPath();X.moveTo(-.4*u,0);X.lineTo(.08*u,-.88*u);X.lineTo(.4*u,0);X.closePath();X.fill();X.fillStyle='#fff';X.beginPath();X.ellipse(0,0,.46*u,.12*u,0,0,6.28);X.fill();X.beginPath();X.arc(.1*u,-.9*u,.13*u,0,6.28);X.fill()}
  else if(k===9){X.fillStyle='#1b1b1f';X.strokeStyle='#d9a521';X.lineWidth=.05*u;X.lineJoin='round';X.beginPath();X.moveTo(-.78*u,0);X.quadraticCurveTo(-.62*u,-.66*u,0,-.72*u);X.quadraticCurveTo(.62*u,-.66*u,.78*u,0);X.quadraticCurveTo(0,-.22*u,-.78*u,0);X.closePath();X.fill();X.stroke();X.fillStyle='#fff';X.beginPath();X.arc(0,-.4*u,.1*u,0,6.28);X.fill();X.strokeStyle='#fff';X.lineWidth=.04*u;X.beginPath();X.moveTo(-.17*u,-.2*u);X.lineTo(.17*u,-.3*u);X.moveTo(-.17*u,-.3*u);X.lineTo(.17*u,-.2*u);X.stroke()}
  else if(k===10){X.fillStyle='#3a2268';X.beginPath();X.ellipse(0,0,.72*u,.16*u,0,0,6.28);X.fill();X.fillStyle='#4b2e83';X.beginPath();X.moveTo(-.46*u,0);X.lineTo(.1*u,-1.12*u);X.lineTo(.46*u,0);X.closePath();X.fill();X.fillStyle='#f4c430';X.fillRect(-.46*u,-.2*u,.92*u,.1*u);for(const q of[[-.06,-.5],[.14,-.78],[.2,-.32]]){X.beginPath();X.arc(q[0]*u,q[1]*u,.05*u,0,6.28);X.fill()}}
  else if(k===11){X.fillStyle='#9aa1a8';X.beginPath();X.arc(0,0,.44*u,Math.PI,0);X.closePath();X.fill();X.fillStyle='#6f767d';X.fillRect(-.44*u,-.1*u,.88*u,.1*u);X.strokeStyle='#f3ead2';X.lineWidth=.13*u;X.lineCap='round';for(const sg of[-1,1]){X.beginPath();X.moveTo(sg*.4*u,-.12*u);X.quadraticCurveTo(sg*.78*u,-.12*u,sg*.74*u,-.62*u);X.stroke()}}
  else if(k===12){X.fillStyle='#e6c76a';X.beginPath();X.ellipse(0,0,.88*u,.2*u,0,0,6.28);X.fill();X.fillStyle='#efd37f';X.beginPath();X.ellipse(0,0,.4*u,.5*u,0,Math.PI,0);X.closePath();X.fill();X.fillStyle='#c0392b';X.fillRect(-.4*u,-.18*u,.8*u,.1*u)}
  else if(k===13){for(const sg of[-1,1]){X.fillStyle='#444a52';X.beginPath();X.moveTo(sg*.12*u,-.08*u);X.lineTo(sg*.36*u,-.78*u);X.lineTo(sg*.52*u,-.04*u);X.closePath();X.fill();X.fillStyle='#ff8fa3';X.beginPath();X.moveTo(sg*.2*u,-.1*u);X.lineTo(sg*.36*u,-.56*u);X.lineTo(sg*.44*u,-.08*u);X.closePath();X.fill()}}
  else if(k===14){X.fillStyle='#f6c21b';X.beginPath();X.arc(0,0,.44*u,Math.PI,0);X.closePath();X.fill();X.fillRect(-.56*u,-.06*u,1.12*u,.09*u);X.fillStyle='#d9a40f';X.fillRect(-.07*u,-.46*u,.14*u,.42*u)}
  X.restore()}
function glasses(X,k,r){
  const ex=r*.7,ey=r*.3,er=r*.24;X.save();X.lineCap='round';
  if(k===1){X.fillStyle='#0b0b0b';X.strokeStyle='#0b0b0b';X.lineWidth=r*.08;X.beginPath();X.moveTo(ex,-ey);X.lineTo(ex,ey);X.stroke();for(const sg of[-1,1]){X.beginPath();X.ellipse(ex,sg*ey,er*.95,er*1.1,0,0,6.28);X.fill()}X.fillStyle='rgba(255,255,255,.55)';for(const sg of[-1,1]){X.beginPath();X.arc(ex+er*.3,sg*ey-er*.35,er*.22,0,6.28);X.fill()}}
  else if(k===2){X.strokeStyle='#d9a521';X.lineWidth=r*.07;X.fillStyle='rgba(190,225,255,.28)';X.beginPath();X.moveTo(ex,-ey);X.lineTo(ex,ey);X.stroke();for(const sg of[-1,1]){X.beginPath();X.arc(ex,sg*ey,er*1.2,0,6.28);X.fill();X.stroke()}}
  else if(k===3){X.fillStyle='#ff4d6d';for(const sg of[-1,1])heart(X,ex,sg*ey,er*.95)}
  else if(k===4){X.fillStyle='#14161c';X.beginPath();X.ellipse(ex,0,r*.3,r*.46,0,0,6.28);X.fill();for(const sg of[-1,1]){X.fillStyle='#fff';X.beginPath();X.arc(ex+r*.02,sg*ey,er*.8,0,6.28);X.fill();X.fillStyle='#d62a1f';X.beginPath();X.arc(ex+r*.04,sg*ey,er*.45,0,6.28);X.fill()}}
  else if(k===5){for(const sg of[-1,1]){X.fillStyle=sg<0?'rgba(255,50,50,.8)':'rgba(40,200,255,.8)';X.fillRect(ex-er,sg*ey-er*1.05,er*2,er*2.1)}X.strokeStyle='#fff';X.lineWidth=r*.06;for(const sg of[-1,1])X.strokeRect(ex-er,sg*ey-er*1.05,er*2,er*2.1);X.beginPath();X.moveTo(ex,-ey);X.lineTo(ex,ey);X.stroke()}
  else if(k===6){X.strokeStyle='#d9a521';X.lineWidth=r*.07;X.fillStyle='rgba(190,225,255,.28)';X.beginPath();X.arc(ex,ey,er*1.25,0,6.28);X.fill();X.stroke();X.lineWidth=r*.03;X.beginPath();X.moveTo(ex-er*1.2,ey+er*.4);X.quadraticCurveTo(r*.2,r*.62,r*.05,r*.5);X.stroke()}
  else if(k===7){X.fillStyle='#ffd23f';X.strokeStyle='#c9961a';X.lineWidth=r*.03;for(const sg of[-1,1])star(X,ex,sg*ey,er*1.35)}
  else if(k===8){X.fillStyle='#10202a';X.fillRect(ex-er*.7,-r*.5,er*1.4,r*1.0);X.fillStyle='#38e8ff';X.fillRect(ex-er*.2,-r*.44,er*.4,r*.88)}
  X.restore()}
function backAcc(X,k,r,c){if(k===7){const fl=Math.sin(T*6+c.ph)*.12;X.save();X.fillStyle='#fdfdf8';X.strokeStyle='#e9c46a';X.lineWidth=r*.05;for(const sg of[-1,1]){X.beginPath();X.ellipse(-r*.5,sg*r*1.0,r*.95,r*.4,sg*(.7+fl),0,6.28);X.fill();X.stroke();X.beginPath();X.ellipse(-r*.15,sg*r*.8,r*.6,r*.26,sg*(.9+fl),0,6.28);X.fill();X.stroke()}X.restore();return}if(k!==3)return;const fl=Math.sin(T*8+c.ph)*r*.12;X.save();X.fillStyle='#7b2cbf';X.strokeStyle='#f4c430';X.lineWidth=r*.06;X.lineJoin='round';X.beginPath();X.moveTo(r*.15,-r*.55);X.lineTo(-r*1.5,-r*1.0+fl);X.quadraticCurveTo(-r*1.15,0,-r*1.5,r*1.0-fl);X.lineTo(r*.15,r*.55);X.closePath();X.fill();X.stroke();X.restore()}
function frontAcc(X,f,r,c){
  glasses(X,f[1],r);const k=f[2];if(!k)return;X.save();X.lineCap='round';
  if(k===1){X.strokeStyle='#3b2412';X.lineWidth=r*.1;for(const sg of[-1,1]){X.beginPath();X.moveTo(r*.98,0);X.quadraticCurveTo(r*1.1,sg*r*.1,r*1.04,sg*r*.3);X.quadraticCurveTo(r*1.0,sg*r*.36,r*.9,sg*r*.3);X.stroke()}}
  else if(k===2){X.fillStyle='#e63946';for(const sg of[-1,1]){X.beginPath();X.moveTo(r*.12,0);X.lineTo(0,sg*r*.46);X.lineTo(r*.26,sg*r*.46);X.closePath();X.fill()}X.fillStyle='#a4161a';X.beginPath();X.arc(r*.12,0,r*.09,0,6.28);X.fill()}
  else if(k===3){X.fillStyle='#f4c430';X.beginPath();X.arc(r*.14,0,r*.1,0,6.28);X.fill()}
  else if(k===4){const fl=Math.sin(T*9+c.ph)*r*.08;X.fillStyle='#2a9d8f';X.fillRect(r*.02,-r*.58,r*.26,r*1.16);X.fillStyle='#e9c46a';X.fillRect(r*.02,-r*.2,r*.26,r*.12);X.fillRect(r*.02,r*.22,r*.26,r*.12);X.fillStyle='#2a9d8f';X.beginPath();X.moveTo(r*.1,r*.2);X.lineTo(-r*.75,r*.34+fl);X.lineTo(-r*.7,r*.62+fl);X.lineTo(r*.1,r*.5);X.closePath();X.fill();X.fillStyle='#e9c46a';X.beginPath();X.arc(-r*.4,r*.45+fl*.7,r*.06,0,6.28);X.fill()}
  else if(k===5){X.fillStyle='#c1121f';X.beginPath();X.moveTo(r*.12,-r*.07);X.lineTo(r*.12,r*.07);X.lineTo(-r*.55,r*.15);X.lineTo(-r*.72,0);X.lineTo(-r*.55,-r*.15);X.closePath();X.fill();X.fillStyle='#8f0d17';X.beginPath();X.arc(r*.1,0,r*.08,0,6.28);X.fill()}
  else if(k===6){X.strokeStyle='#f4c430';X.lineWidth=r*.07;X.beginPath();X.ellipse(r*.15,0,r*.2,r*.52,0,0,6.28);X.stroke();X.fillStyle='#f4c430';X.beginPath();X.arc(-r*.05,0,r*.11,0,6.28);X.fill();X.fillStyle='#e63946';X.beginPath();X.arc(-r*.05,0,r*.05,0,6.28);X.fill()}
  else if(k===8){const fx=r*.55,fy=r*.5;X.fillStyle='#ff7aa8';for(let i=0;i<5;i++){const a=i*6.2832/5;X.beginPath();X.arc(fx+Math.cos(a)*r*.15,fy+Math.sin(a)*r*.15,r*.12,0,6.28);X.fill()}X.fillStyle='#ffd23f';X.beginPath();X.arc(fx,fy,r*.09,0,6.28);X.fill()}
  X.restore()}
function renderFly(cv,fit,name){const g=cv.getContext('2d'),W=cv.width,H=cv.height,m=10,r=rad(m),s=name?H/(r*4.6):Math.min(W,H)/(r*3.6);g.setTransform(1,0,0,1,0,0);g.clearRect(0,0,W,H);g.translate(W/2+r*.2*s,H*(name?.7:.62));g.scale(s,s);drawFly({x:0,y:0,m,ang:0,ph:0,nolabel:name?0:1,nomass:1,o:{name:name||'',hue:HUES[fit[3]],fit}},s,g)}
function drawFly(c,s,ctx){
  const X=ctx||X0,r=rad(c.m),a=c.ang,fl=Math.sin(T*38+c.ph)*.35,o=c.o,f=o.fit||ZF;
  fxRing(X,o,c,r,s);X.save();X.translate(c.x,c.y);X.rotate(a);X.fillStyle='rgba(0,0,0,.28)';X.beginPath();X.ellipse(r*.12,r*.2,r*1.05,r*.75,0,0,6.28);X.fill();
  fxBack(X,o,r);backAcc(X,f[2],r,c);
  X.fillStyle='rgba(200,225,255,.35)';X.strokeStyle='rgba(200,225,255,.7)';X.lineWidth=1/s;
  for(const sg of[-1,1]){X.beginPath();X.ellipse(-r*.1,sg*r*.75,r*.95,r*.38*(1+fl*sg*.4),sg*(.5+fl),0,6.28);X.fill();X.stroke()}
  X.fillStyle=`hsl(${o.hue},45%,${o===me?42:30}%)`;X.beginPath();X.ellipse(-r*.25,0,r*.85,r*.6,0,0,6.28);X.fill();X.strokeStyle='rgba(0,0,0,.25)';X.lineWidth=r*.1;X.beginPath();for(const k of[-.55,-.15]){X.moveTo(r*k,-r*.5);X.lineTo(r*k,r*.5)}X.stroke();
  X.fillStyle=`hsl(${o.hue},50%,22%)`;X.beginPath();X.arc(r*.55,0,r*.48,0,6.28);X.fill();
  X.fillStyle='#d62a1f';for(const sg of[-1,1]){X.beginPath();X.arc(r*.7,sg*r*.3,r*.24,0,6.28);X.fill()}
  frontAcc(X,f,r,c);X.restore();
  if(f[0]){const hx=c.x+Math.cos(a)*r*.55,hy=c.y+Math.sin(a)*r*.55;X.save();X.translate(hx,hy-r*.3);hat(X,f[0],r*.8);X.restore()}
  if(teams&&o.t!==undefined){X.strokeStyle=o.t?'#4da3ff':'#ff5a4d';X.lineWidth=3/s;X.beginPath();X.arc(c.x,c.y,r*1.08,0,6.28);X.stroke()}if(o===me){X.strokeStyle='#ffd24a';X.lineWidth=2/s;X.beginPath();X.arc(c.x,c.y,r*1.25,0,6.28);X.stroke()}
  if(c.nolabel)return;
  const ly=c.y-r*1.5-(f[0]?r*.75:0),fs=Math.max(11/s,r*.55);X.textAlign='center';X.font=`600 ${fs}px system-ui,sans-serif`;
  X.lineJoin='round';X.lineWidth=fs*.2;X.strokeStyle='rgba(4,10,7,.9)';X.strokeText(o.name,c.x,ly);X.fillStyle=NCOL[f[4]]||'#fff';X.fillText(o.name,c.x,ly);
  if(!c.nomass){X.strokeText(Math.round(c.m),c.x,ly-fs*1.15);X.fillStyle='#ffd24a';X.fillText(Math.round(c.m),c.x,ly-fs*1.15);}
}
function draw(){
  X.setTransform(dpr,0,0,dpr,0,0);X.fillStyle='#050c08';X.fillRect(0,0,w,h);
  const m=mine();let cx=cam.x,cy=cam.y,tot=0,spread=0;
  if(m.length){cx=cy=0;for(const c of m){cx+=c.x;cy+=c.y;tot+=c.m}cx/=m.length;cy/=m.length;for(const c of m)spread=Math.max(spread,Math.hypot(c.x-cx,c.y-cy))}
  const tgt=full?Math.min(w,h)/(WORLD*1.04):clamp(1.15-(rad(tot||10)+spread)/140,.3,1.1);
  scl+=(tgt-scl)*.12;const s=scl;
  const tx=full?WORLD/2:cx,ty=full?WORLD/2:cy;cam.x+=(tx-cam.x)*.2;cam.y+=(ty-cam.y)*.2;
  X.translate(w/2-cam.x*s,h/2-cam.y*s);X.scale(s,s);
  X.drawImage(BG,0,0,WORLD,WORLD);
  const vx0=cam.x-w/2/s-20,vx1=cam.x+w/2/s+20,vy0=cam.y-h/2/s-20,vy1=cam.y+h/2/s+20;
  X.strokeStyle='rgba(255,90,77,.22)';X.lineWidth=20/s;X.strokeRect(0,0,WORLD,WORLD);
  X.strokeStyle='rgba(255,110,95,.95)';X.lineWidth=5/s;X.strokeRect(0,0,WORLD,WORLD);
  for(const f of food){if(f.x<vx0||f.x>vx1||f.y<vy0||f.y>vy1)continue;const q=f.e?6:5;
    X.fillStyle=`hsla(${f.c},80%,60%,.22)`;X.beginPath();X.arc(f.x,f.y,q*2,0,6.28);X.fill();
    X.fillStyle=`hsl(${f.c},75%,62%)`;X.beginPath();X.arc(f.x,f.y,q,0,6.28);X.fill();
    X.fillStyle='rgba(255,255,255,.55)';X.beginPath();X.arc(f.x-q*.3,f.y-q*.3,q*.28,0,6.28);X.fill()}
  drawPups(s,vx0,vx1,vy0,vy1);
  [...cells].sort((a,b)=>a.m-b.m).forEach(c=>drawFly(c,s));
  X.setTransform(dpr,0,0,dpr,0,0);const vg=X.createRadialGradient(w/2,h/2,Math.min(w,h)*.35,w/2,h/2,Math.max(w,h)*.75);vg.addColorStop(0,'rgba(0,0,0,0)');vg.addColorStop(1,'rgba(0,0,0,.45)');X.fillStyle=vg;X.fillRect(0,0,w,h);
}
const $=id=>document.getElementById(id);
const esc=t=>String(t).replace(/[&<>"']/g,c=>({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[c]));
function lists(){
  const all=[...owners,...Object.values(ro)],tot=new Map();for(const c of cells)tot.set(c.o,(tot.get(c.o)||0)+c.m);
  const row=(o,v,rk)=>`<div class="row${o===me?' me':''}"><span>${rk?'<i>'+rk+'</i>':''}${esc(o.name)}</span><span>${v}</span></div>`;
  $('lb').innerHTML=all.filter(o=>tot.get(o)>0).sort((x,y)=>tot.get(y)-tot.get(x)).slice(0,8).map((o,i)=>row(o,Math.round(tot.get(o)),i+1)).join('');
  $('dl').innerHTML=all.sort((x,y)=>y.deaths-x.deaths).map(o=>row(o,'💀 '+o.deaths)).join('');
  $('ms').textContent='Massa '+Math.round(tot.get(me)||0);teamHud();pwHud();
}
document.getElementById('nm').addEventListener('input',e=>{me.name=e.target.value.trim()||'Tu'});
const mapBtn=document.getElementById('map');
const tgl=()=>{full=!full;mapBtn.textContent=full?'Torna alla mosca':'Mappa intera'};
mapBtn.addEventListener('click',tgl);
document.getElementById('sp').addEventListener('click',split);
document.getElementById('ej').addEventListener('click',eject);
addEventListener('keydown',e=>{if(e.target.tagName==='INPUT'||!playing)return;const k=e.key.toLowerCase();
  if(k==='m')tgl();else if(k==='z')zp();else if(k==='y')eject();else if(k==='t'){if(!e.repeat)split()}else if(k.length===1&&'wasd'.includes(k)){keys[k]=true;kb=true}});
addEventListener('keyup',e=>{keys[e.key.toLowerCase()]=false});
addEventListener('blur',()=>{for(const k in keys)keys[k]=false});
function pm(e){const r=C.getBoundingClientRect(),nx=e.clientX-r.left,ny=e.clientY-r.top;if(Math.hypot(nx-mx,ny-my)>4)kb=false;mx=nx;my=ny}
C.addEventListener('pointermove',pm);C.addEventListener('pointerdown',pm);
function zp(){const z=$('zp');z.hidden=!z.hidden;if(!z.hidden){$('zv').value=Math.round(mine().reduce((t,c)=>t+c.m,0))||10;$('zv').focus();$('zv').select()}}
function zset(){const v=clamp(+$('zv').value||10,10,5000),m=mine(),t=m.reduce((q,c)=>q+c.m,0);if(t>0)for(const c of m)c.m*=v/t;$('zp').hidden=true;$('zv').blur()}
$('zok').onclick=zset;$('zx').onclick=()=>{$('zp').hidden=true};
$('zv').addEventListener('keydown',e=>{if(e.key==='Enter')zset();else if(e.key==='Escape')$('zp').hidden=true});
$('tl').onclick=()=>$('app').classList.toggle('hl');$('tr').onclick=()=>$('app').classList.toggle('hr');$('th').onclick=()=>$('hud').classList.toggle('off');
const lname=()=>$('lnm').value.trim().slice(0,14)||'Tu';
function startGame(bt,host){
  playing=true;iHost=host;cells.length=0;owners.length=0;for(const k in ro)delete ro[k];seed=room?strHash(roomCode):(Math.random()*1e9|0);food=mkFood();elog.length=0;pups=mkPups();plog.length=0;pw.x2=0;pw.tb=0;
  me=mk(lname(),false);$('nm').value=me.name;me.t=teams&&myT>=0?myT:undefined;if(me.t!==undefined)me.hue=me.t?215:5;me.fit=myFit;if(me.t===undefined)me.hue=HUES[myFit[3]];over=false;t0=performance.now();KB=[0,0];lastHit=-1;for(const k in TK)delete TK[k];$('end').hidden=true;
  if(bt&&(host||!room))NAMES.forEach(n=>mk(n,true));
  $('lobby').hidden=true;
}
const hueOf=t=>{let q=0;for(const ch of t)q=(q*31+ch.charCodeAt(0))%360;return q};
function own(key,name,deaths,hue,t,fit,fx){const o=ro[key]||(ro[key]={});o.t=t;o.fit=fit;o.fx=fx||null;o.name=String(name||'Mosca').slice(0,14);o.deaths=+deaths||0;o.hue=hue;return o}
function sync(key,list,o,pe){
  const cs=cells.filter(c=>c.key===key);list=list.filter(Array.isArray);
  list.forEach((q,i)=>{const x=+q[0]||0,y=+q[1]||0,m=clamp(+q[2]||1,1,6000);let c=cs[i];
    if(!c){c={o,r:1,key,pe,x,y,px:x,py:y,vx:0,vy:0,bx:0,by:0,mt:0,ang:0,ph:rnd(0,6)};cells.push(c)}
    c.o=o;c.px=x;c.py=y;c.m=m});
  for(let i=list.length;i<cs.length;i++)cells.splice(cells.indexOf(cs[i]),1);
}
function gain(x){const c=mine().sort((a,b)=>b.m-a.m)[0];if(c)c.m+=x}
function onP(ch){
  const ps=(ch&&ch.peers)||room.peers(),alive=new Set(),mp=ps.find(p=>p.isMe&&p.sameTab);
  if(mp)myPeer=mp.peer;
  const hp=ps.find(p=>p.presence&&p.presence.host);
  if(hp&&!iHost&&!playing)teams=!!hp.presence.tm;
  if(teams&&myT<0&&!iHost){const cc=[0,0];for(const p of ps){const tt=p.presence&&p.presence.t;if(tt===0||tt===1)cc[tt]++}myT=cc[0]<=cc[1]?0:1;room.presence({t:myT}).catch(()=>{})}
  if(hp&&hp.presence.s&&!playing&&!iHost)startGame(!!hp.presence.bots,false);
  if(hp&&hp.presence.res&&playing&&!over)finish(hp.presence.res);
  if(playing)for(const p of ps){
    const d=p.presence||{};if(p.isMe||!Array.isArray(d.c))continue;
    alive.add(p.peer);if(Array.isArray(d.fe))for(const q of d.fe){const i=Array.isArray(q)?+q[0]:-1,v=Array.isArray(q)?+q[1]:0;if(i>=0&&i<520&&v>food[i].v&&v<1e6)Object.assign(food[i],foodAt(i,v))}if(Array.isArray(d.pe))for(const q of d.pe){const i=Array.isArray(q)?+q[0]:-1,v=Array.isArray(q)?+q[1]:0;if(i>=0&&i<pups.length&&v>pups[i].v&&v<1e6)Object.assign(pups[i],puAt(i,v))}if(Array.isArray(d.kb)){const k=TK[p.peer]||(TK[p.peer]=[0,0]);k[0]=Math.max(k[0],+d.kb[0]||0);k[1]=Math.max(k[1],+d.kb[1]||0)}const tv=teams&&(d.t===0||d.t===1)?d.t:undefined;const fo=cleanFit(d.o);sync(p.peer,d.c.slice(0,8),own(p.peer,d.n,d.d,tv!==undefined?(tv?215:5):(fo[3]?HUES[fo[3]]:hueOf(p.peer)),tv,fo,Array.isArray(d.x)?d.x:null),p.peer);
    const v=+(d.g&&d.g[myPeer])||0;
    if(seenG[p.peer]===undefined)seenG[p.peer]=v;else if(v>seenG[p.peer]){gain(v-seenG[p.peer]);seenG[p.peer]=v}
    if(Array.isArray(d.b))for(const q of d.b.slice(0,20)){if(!Array.isArray(q))continue;const k='b'+p.peer+':'+q[0];alive.add(k);sync(k,[[q[1],q[2],q[3]]],own(k,NAMES[(+q[0]||1)-1],q[4],20+((+q[0]||0)*17)%40),null)}
  }
  for(let i=cells.length-1;i>=0;i--)if(cells[i].r&&!alive.has(cells[i].key))cells.splice(i,1);
  for(const k in ro)if(!alive.has(k))delete ro[k];
  $('bsw').hidden=!teams;if(!$('l3').hidden)$('plist').innerHTML=ps.filter(p=>p.kind==='viewer').map(p=>{const d=p.presence||{};return `<div class="row"><span>${teams&&(d.t===0||d.t===1)?'<b style="color:'+(d.t?'#4da3ff':'#ff5a4d')+'">● </b>':''}${esc(String(d.n||'Giocatore').slice(0,14))}${p.isMe?' (tu)':''}${d.host?' – host':''}</span></div>`}).join('');
}
function pub(){
  const p={n:me.name,d:me.deaths,g:G,fe:elog,kb:KB,t:myT,o:myFit,pe:plog,x:me.fx||[0,0],c:mine().map(c=>[Math.round(c.x),Math.round(c.y),+c.m.toFixed(1)])};
  if(iHost)p.b=cells.filter(c=>!c.r&&c.o.bot).map(c=>[c.o.id,Math.round(c.x),Math.round(c.y),+c.m.toFixed(1),c.o.deaths]);
  room.presence(p).catch(()=>{});
}
const genCode=()=>{const CH='abcdefghjkmnpqrstuvwxyz23456789';let c='';for(let i=0;i<4;i++)c+=CH[Math.floor(Math.random()*CH.length)];return c};
function netRoom(code){
  const create=creating;
  return new Promise((resolve,reject)=>{
    const st={},conns=new Set();let myId=null,dirty=false,cb=null,hc=null,done=false,iv=0;
    const pr=new Peer(create?'flyio-'+code:undefined);
    const fail=e=>{if(done)return;done=true;clearInterval(iv);try{pr.destroy()}catch(_){}reject(e)};
    const api={
      presence(p){Object.assign(st[myId]||(st[myId]={}),p);dirty=true;if(!create&&hc&&hc.open)hc.send({t:'p',p});return Promise.resolve()},
      peers(){return Object.keys(st).map(id=>({peer:id,isMe:id===myId,sameTab:id===myId,kind:'viewer',presence:st[id]}))},
      onPeers(f){cb=f},
      leave(){clearInterval(iv);try{pr.destroy()}catch(_){}}
    };
    iv=setInterval(()=>{if(!dirty)return;dirty=false;if(create){const m={t:'s',s:st};for(const c of conns)if(c.open)c.send(m)}if(cb)cb({peers:api.peers()})},90);
    pr.on('error',fail);
    pr.on('connection',c=>{
      conns.add(c);
      c.on('data',m=>{if(m&&m.t==='p'&&m.p&&typeof m.p==='object'){Object.assign(st[c.peer]||(st[c.peer]={}),m.p);dirty=true}});
      c.on('close',()=>{conns.delete(c);delete st[c.peer];dirty=true});
      c.on('open',()=>{st[c.peer]=st[c.peer]||{};dirty=true});
    });
    pr.on('open',pid=>{
      myId=pid;st[myId]={};
      if(create){done=true;resolve(api);return}
      const c=pr.connect('flyio-'+code,{serialization:'json',reliable:true});hc=c;
      c.on('open',()=>{done=true;resolve(api)});
      c.on('data',m=>{if(m&&m.t==='s'&&m.s&&typeof m.s==='object'){const mine=st[myId];for(const k in st)delete st[k];Object.assign(st,m.s);if(mine&&!st[myId])st[myId]=mine;dirty=true}});
      c.on('close',()=>{for(const k in st)if(k!==myId)delete st[k];dirty=true});
      setTimeout(()=>fail(new Error('timeout')),9000);
    });
  });
}
async function enter(code){
  try{
    if(typeof claude!=='undefined'){const R=await claude.use('room');if(R){room=await R.join('fly-'+code);roomCode=code;room.onPeers(onP,()=>{});return room}}
    if(typeof Peer==='undefined')return null;
    for(let k=0;k<3;k++){
      try{room=await netRoom(code);roomCode=code;room.onPeers(onP);return room}
      catch(e){if(!(creating&&e&&e.type==='unavailable-id'))return null;code=genCode()}
    }
  }catch(e){}
  return null;
}
const show=id=>{for(const q of['l0','l1','l2','l3'])$(q).hidden=q!==id};
const err=t=>{$('lerr').textContent=t};
$('bc0').onclick=()=>{err('');show('l1')};$('bj0').onclick=()=>{err('');show('l2')};
$('bb1').onclick=$('bb2').onclick=()=>{err('');show('l0')};
function setBots(v){bots=v;$('bs').setAttribute('aria-pressed',String(v));$('bn').setAttribute('aria-pressed',String(!v))}
function setMode(v){tmode=v;$('mf').setAttribute('aria-pressed',String(!v));$('mt').setAttribute('aria-pressed',String(v))}
$('mf').onclick=()=>setMode(false);$('mt').onclick=()=>setMode(true);$('bsw').onclick=()=>{myT=myT?0:1;room.presence({t:myT})};
$('bs').onclick=()=>setBots(true);$('bn').onclick=()=>setBots(false);
$('bf').onclick=async()=>{creating=true;
  err('');let code='';const CH='abcdefghjkmnpqrstuvwxyz23456789';for(let i=0;i<4;i++)code+=CH[Math.floor(Math.random()*CH.length)];
  const r=await enter(code);
  if(!r){err('Multiplayer non disponibile: giochi da solo.');setTimeout(()=>startGame(bots,true),1200);return}
  iHost=true;teams=tmode;myT=teams?0:-1;await r.presence({host:1,bots:bots?1:0,s:0,n:lname(),tm:teams?1:0,t:myT});
  $('code').textContent=roomCode.toUpperCase();$('bst').hidden=false;$('wait').textContent='Quando ci sono tutti, premi Inizia gioco.';show('l3');onP({peers:r.peers()});
};
$('bj').onclick=async()=>{creating=false;
  err('');const code=$('jc').value.trim().toLowerCase();if(!/^[a-z0-9]{3,8}$/.test(code)){err('Codice non valido.');return}
  const r=await enter(code);if(!r){err('Impossibile connettersi alla stanza.');return}
  await r.presence({n:lname()});$('code').textContent=code.toUpperCase();$('bst').hidden=true;$('wait').textContent='In attesa che l’host inizi il gioco…';show('l3');onP({peers:r.peers()});
  setTimeout(()=>{if(playing||!room)return;if(!room.peers().some(p=>p.presence&&p.presence.host)){err('Nessuna stanza trovata con questo codice.');room.leave();room=null;show('l2')}},3500);
};
$('bst').onclick=()=>{room.presence({s:1});startGame(bots,true)};
let wTab=0;
const TABS=[['Cappelli',HATS],['Occhiali',GLS],['Extra',EXT],['Colore',COLN],['Nome',NCOLN]];
function applyFit(){if(me&&me.id>=0&&me.t===undefined)me.hue=HUES[myFit[3]];try{localStorage.setItem('flyio-fit',JSON.stringify(myFit))}catch(e){}}
function renderTabs(){const box=$('wt');box.innerHTML='';TABS.forEach((t,i)=>{const b=document.createElement('button');b.type='button';b.textContent=t[0];b.setAttribute('aria-pressed',String(i===wTab));b.onclick=()=>{wTab=i;renderTabs();renderOpts()};box.appendChild(b)})}
function renderOpts(){const box=$('wo');box.innerHTML='';TABS[wTab][1].forEach((nm,i)=>{const b=document.createElement('button');b.type='button';b.className='opt';b.setAttribute('aria-pressed',String(myFit[wTab]===i));const cv=document.createElement('canvas');cv.width=cv.height=112;const sp=document.createElement('span');sp.textContent=nm;b.append(cv,sp);b.onclick=()=>{myFit[wTab]=i;applyFit();renderOpts()};box.appendChild(b);if(wTab===4){const g=cv.getContext('2d');g.clearRect(0,0,112,112);g.font='700 34px system-ui,sans-serif';g.textAlign='center';g.textBaseline='middle';g.lineJoin='round';g.lineWidth=7;g.strokeStyle='rgba(4,10,7,.9)';g.strokeText('Aa',56,58);g.fillStyle=NCOL[i];g.fillText('Aa',56,58)}else{const f=[0,0,0,myFit[3],0];f[wTab]=i;renderFly(cv,f)}})}
function openWd(){$('wd').hidden=false;renderTabs();renderOpts()}
function drawPreview(){renderFly($('wp'),myFit,playing&&me.id>=0?me.name:lname())}
$('bwd').onclick=openWd;$('wb').onclick=openWd;$('wx').onclick=()=>{$('wd').hidden=true};
addEventListener('keydown',e=>{if(e.key==='Escape')$('wd').hidden=true});
const TN=['Rossa','Blu'];
const score=k=>KB[k]+Object.values(TK).reduce((s,v)=>s+(v[k]||0),0);
const teamMass=k=>cells.reduce((q,c)=>q+(c.o.t===k?c.m:0),0);
function showEnd(r){const n=x=>Math.round(+x)||0,w=r.w===0||r.w===1?r.w:-1,k=Array.isArray(r.k)?r.k:[0,0],m=Array.isArray(r.m)?r.m:[0,0];$('et').textContent=w<0?'Pareggio!':'Vince la squadra '+TN[w]+'!';$('ed').innerHTML=`Mangiate: Rossa ${n(k[0])} – ${n(k[1])} Blu<br>Massa finale: Rossa ${n(m[0])} – ${n(m[1])} Blu`;$('end').hidden=false}
function finish(r){if(over)return;over=true;showEnd(r)}
function teamTick(){
  if(!teams||over)return;const el=(performance.now()-t0)/1000,auth=iHost||!room;if(!auth&&el<190)return;
  const s0=score(0),s1=score(1);let w=null;
  if(s0>=3||s1>=3)w=s0===s1?-1:s0>s1?0:1;
  else if(el>=180){const a=teamMass(0),b=teamMass(1);w=Math.abs(a-b)<1?-1:a>b?0:1}
  if(w===null)return;
  const r={w,k:[s0,s1],m:[Math.round(teamMass(0)),Math.round(teamMass(1))]};finish(r);if(auth&&room)room.presence({res:r}).catch(()=>{});
}
function teamHud(){const e=$('tm');e.hidden=!teams||over;if(e.hidden)return;const l=Math.max(0,180-Math.floor((performance.now()-t0)/1000));e.innerHTML=`<span style="color:#ff6b5e">Rossa ${score(0)}</span> <b>${Math.floor(l/60)}:${String(l%60).padStart(2,'0')}</b> <span style="color:#6db4ff">${score(1)} Blu</span> · primi a 3`}
$('er').onclick=()=>location.reload();
let last=performance.now(),lt=0;
function loop(t){const dt=Math.min(.05,(t-last)/1000);last=t;T+=dt;if(playing&&!over){step(dt);teamTick();pt+=dt;if(room&&pt>.08){pt=0;pub()}}draw();if(!$('wd').hidden)drawPreview();lt+=dt;if(lt>.25){lt=0;if(playing)lists()}requestAnimationFrame(loop)}
rs();mx=w/2;my=h/2;requestAnimationFrame(loop);
</script>
</body>
</html>
