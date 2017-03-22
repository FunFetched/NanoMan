pico-8 cartridge // http://www.pico-8.com
version 8
__lua__
--nanoman v1.0
--by fun fetched/gruber music

secs=-1

weapons={
 "nano",
 "laser",
 "armor",
 "dash",
 "seek",
 "hammer"
}

wpndrn={0,2,2,2,2,2}
lightcol={6,2,13,10,11,4}
darkcol={13,9,6,12,3,2}

--[[
      vs.
laser     buster
armor     hammer
dash      laser
seek      dash
hammer    seek
--]]

--most levels are stored in
--string data here, except for
--the dr. pico level, which is
--stored in map data, then
--copied to a string in ram

lvls={
 --dr. pico
 {
  x=108,y=17 --108,17 110,29
 },
 --laserman
 {
  x=65,y=21,--65,21/72,19
  str="/70005161405261a0f170c0f171e0f370022f70d2d370e3f361062960daff70dbff605caf71ecff705dafc93e4f716e9fc9becf703f4f70bfcf.6e426f526ea26fb2/7000f261606371d0e37e21417e91b170c3f3600afa700b0f70cbff71dcef701dbf.7d117f417d817fb17003c5336d63c583c42c/7000f070010360c8ff70c9ff71daef609bbf709cbf71adbf600e8f700f8f.c5b170f1d9d7d9aa/60a5b570f6ff606878602b3b.fa824ef5/7030f16071c170324a70f2fa6075c570060f5e96af5fa6af60586860d8e8707b8f618b8f61bbcf70cbcf601e6f60deff701f6f70dfff.fa834f054e954fa56e3a6f4a/7000f04b909f71014a70414a70e1ff71f1f570023a7d03397e13397f333961043860d7f771f9fd600edf700fdf.c3d3c258705ac3db/7000f04b909f70013f71112470d1f661d2f560164670e7ff71f7fb71182b704c4f70dcdf605e8f60aecf705f8f70afcf.c242ff66c3d8c24a/70000f4b202f7070fa7181b97d92a87fa2a86193a7605464604767603a6a70cbff601fbf.d953d946d9394b9f/7000f05ef0f370010f7013634b232f61040e70546461455f70555f6069b9706aaf717b9e60beff70bfff.6d91c5d16ef36144ff36c266ff17ff1bff3cc2bd704f/5f00f17010f1600eff700fff.5f02c5826df26f03d94dd99dd9ed/7000f070c1f671d1d570f7ff5e697f5f797f704b5f615b5f618b9f709b9f600e3f60aebf700f3f70afbf.fa444e684f78/7000b070f0ff7001846002727094b470050f604bec704cec704d4f707def718dee705f6f.10a3ae5daf6dbe5ebf6e/70000f7040f04d50734d90b37041c26151736191b370f1ff6d53736d93b3601cef701def712e4f7e7e9e71bedf.02cb7d6e7f9e"
 },
 --armorman
 {
  x=81,y=17,--81,17/87,21
  str="/63e0f272f0f24d223673030f5d23365b1526620a3f733a3f63caff62daff73faff720b2f72dbef624cbd724dbd.7c257c36/7200f27050b27501315d61745d91a475d1f16d64746d94a4633c7f624c7f737c7f724d6f63bdff62cdff73fdff72ceef.fc17fc99/7200f27030927501115d41545d718475b1d163f3fb6d44546d7484633b7f624b7f737b7f724c6f63beff62ceff72cfff.fc98fc19/7240f05e80925f909273010b5bc1f163f1fb6217b74b272f72475f628bfb620e3f626eff720f3f726fff.73006c105b206b305e505f606d316e516f61727172a16ab17ce196526e826f926db29683ff15ef98efa8ff39ff1a/7300235d102373040b63f4ff620eef720fff.6c225c326c135c23faa370c570977069703b/5d60f17270f15d626b63f2ff62043473050f6247584b979f5db7bf724858621b3b621ebf73bebf720faf.c5b2c2154b965aa66bb6c2796c6b5c7b/7200b073b0b163f0ff72011173020f6255f563b6ff72c6ff4dd8ed5dd9ed726b7f737b7f6ddded621e6e720f5f.c581c2155b075c17c21b720e/72007063b0ff72c0ff73010f71d1e46245a571d6e9621a7a71dbee624faf.7370ff11ff14ff16ffa6ff19ffa9ff1bffabff1effae/73000f7240e05d41d17281925d62735da2b462073f62e7ff72083872e8f872092f62495f62c9df72f9ff723a5a72caea711b4c724b4f626b7f62abbf72dbfe71ebfe725c7c72accc723d3f725d6f628d9f72bdcf7e2e4e727eaf72dfef.5dc06ad05ce06ec16fd16e426f5296c296436e636f7396646ea46fb496a57d1e7f4e/63f0ff6214b463051f73151f72080f5b98f97299f95b6a8a721ebf622ebe73bebf.6304fac662076a885d895a5a7c8a/7200b063f0ff5b01947271947391947202625d626572435472043473050f625bbb725c7c737c7f634d4f727eff628efe725f6f.73b06b616b335d346d356d65634b634cefbcae5daf6d109defadbe5ebf6e/73000f6340f17250f163f2ff620b4f62bbff720c4c72bcfc720d2f625daf706d9f72ddff723e5f4a7e8e72cecf.03ba6a4e5b5e5bae6bbe5d4f72af5dbf"
 },
 --dashman
 {
  x=65,y=25,--65,25/70,29
  str="/74005274a0f25d21245d41445db1b45dd1d474030f74f3fa4d6b9f656c9f757c8f745d5f74adaf641f4f64bfff.6d236d436db36dd37524754475b475d44e7b4f8b/7400f074010a6415f54b353a74f6ff640aea4bcacf640fef.ee43ed18ee7d/7400f074f1ff6405a574060f645aea641fbf.c3e8c219/7400b074f0ff74010f6455e5641aaa644fef.c56174b1c215c3ea/74000f7440f77051857eb1d170f1f57eb3d37564747eb5d5ca57f7641c4f747c7f74acaf74dcdf741d6fc95d6ec98d9fc9bdcfc9edff645efe748f9f74bfcf74efff.7da17fd17da37fd37da57fd5/7400375d50627001255b41527504144b95bf64a5bf64e5ff74a6bf74e6ffca0727740c0f643c4fc91d4f743d4f640e2e645e9f741f2f745f9f.7c517c62fcc2fcd8/74004175103165f0f56401414b557f64657f64a5bf74667f74a6bf64cbff74ccff65ddfe75edfe640e5f740f5f.fc92fc88/7400f55d20235dd0d35b33d34e43b65e44b65f54565f74765f94965fb4b66e46b674f6ff640bbf740cbf650d0e652d5e753d4e657dae758d9e.7d417e517f617d917ea17fb16c234f534f734f934fb37cd36f566f766f966fb696479667968796a7/7400b074f0ff74010f6485f6c91627c966f67486f665f6fc64172764679764ccfc641d2f74cdef741e6fc93e6fc9aebf643f6f64afbf.6db76dd775b875d8/74006074a0f074010f74a1b474f1ff6474b4644cac654d4f657daf748dafc9beef745f6f74bfef.c5d110e864e9ae5daf6dbe5ebf6e4a9e/74000f6540f07450627480f065414265717274f1ff65070f65f7ff641cef741ded7d3dcd7e4d8d757d8d7eadcd741fef.6da16dc16e526f6204db7f6d7fcd"
 },
 --seekman
 {
  x=81,y=25,--81,25/88,28
  str="/7600f25d30346750645d808477e0f14a51626702226652626792c267d3f35b448466d9ff76daff77ebfe660ccf760dce675d6e772e9e4a5e6e760f4f767fcf.674367736c345c545a647c84/6710f05d50815de0f17601036d51816de1f15b19f9760a0f.760067036609fc2afc5afc8afcbafcea/5d00f06720f06d01115b099966699f766a9f777b8e66accf76adcf66dfff.fc1afc4a/7600f06710b067e0f076010c76c1dc66758f5b568676768f5be6f65b19295b5c6c67ccfc5becfc660f6f669fff.ef71ef81ff65d9f5ff68ff1bd9fb670c/6700f076a0a35b337366637f5be3f376647f76d4d65b86d65b39595bb9f976aaac66dcff76ddff77eeff660f5f668fcf.67a366d35b0667d6d948ede866a95b0c67ac/6700f076203376506376d0f65ee0f65ff0f66733636693af7624297694af6606195b56867607196709695b496966b9ff763a3c76baff67cbef666c8f79ccef760d0f766d8f777e9f661f5f.4a416642ee3467d66ee66ff6ee686639660cee1c673c/7600065b40f076607176a0c267617167a2c24b686f66889f4bf8ff76899f760a0f661e7f66aeff761f7f76afff.6c3076f067f1966296f267066609/7600f05b10205b60705ba0e076315276819276f1ff67325267829266182f4b888f66a8bf76192f76a9bf663e9f763f9f.6be067015de16ce29683660e760f/7600b067106076f0ff76010f7671b267a1a56772827693b466354f76b5b976364b66586f76596f667b8f763c3f767c8f774e7f669eef769fef.4aa266a3ff856795ff26ff57ff7967b9674a4a4b764dff1e/76000f7630f24e31f15b51625b91a25bd1f15e32e26752626792a267d2e276f3ff66182f66586f6698af76192f76596f7699afc93c4fc97c8fc9bccf663d4f667d8f66bdcf763e4f767e8f76becf.4f414f814fc15f425f825fc26e336f436e736f836eb36fc39634967496b4/6710c076f0ff76010f66175867185866c9ef76caeb664ccc76cccf76ecef764d4f767dbf778dae76dddf765f6f.76001326103667da4adbae5daf6dbe5ebf6e/76000f7640f27770b267426267c2e277738477a3b476f3ff67748467a4b4661cef761dee675daf795eaf761f2f76dfef.679205cb673d67cd4a3e4ace764f76bf"
 },
 --hammerman
 {
  x=97,y=30,--97,30/102,27
  str="/7800f27d11437e21437f41435b71a17dc1f37ed1f37ff1f378035378b3f3680bff780cff702dee5b3dde.5a615ca1/7800f36910636990e469142569546578f4f769b5c6680bff780cff791d6f799def.6e336f4396346ed46fe46e156f256e556f656e956fa596d59616965696966eb66fc696b768f7/7800f04bd0d478010778f1ff6844e4680747688a9a780c0f68ddef78deef681fcf.ed34680beebb/7800f04b202778010f7841f47951635b91f15b93f378f5ff68172768879778787f4bd8df681a2a688a9a685d6f785e6f78cecf78eeef781f4f788fbf.5a815a8378774bd768e768cd68edff1eff2eff3eff4eff8eff9effaeffbe/7800f04bd0d578010f78f1ff6815e54b252a681aea4bdadf681fef.fa844b2f/7800f04b202f78010f78f1ff68154f78164779172f78383f68587f78192f78497a5b0a2b5c2a2b794a5f786b6f688baf784c5f787cad5a1d5e5b2d5e5c5d5e797d8f789e9f68beef4bdedf787f8f78afcf.1014d934d967d99a78ef/7800f078010f4b212f4b515b4b818b4bb1bb4be1ebc94eff783fff.ed43ee49681e683e781f/7800f06889bf788aba684b7f789bbd784c8c680d3f785d8f780e4f789eaf68ceff78bfff.fa75/7800f54e22f25b42525b82925bc2d25e23355f33355e63755f73755ea3b55fb3b55ee3f55ff3f5680c3f686cbf68ecff780d3f786dbf7e8dad78edffc94f5fc9cfdf.5d214f324f724fb24ff26e256f356e656f756ea56fb56ee56ff59626966696a696e67d7d7fad7dfd/7800f55d70755b02727eb2e25e23355f33355e63755f73757eb4e478f6ff680c3f686cbf7e0d3f783d3f786dbf7e8dad780e2fc94f5f.4e224f324e624f727da27fe27da47fe46e256f356e656f75962696667f2d7d7d7fad/7800b378f0ff71214271618278041f69a4b878b4b86858a8685bec785cec785d5f788def799dee786f7f.10671387ae6daf7dbe6ebf7e/78001f7850f16851d178e2ff69181a69e8ea686a9f786b9f682c5f68acdf792d5f5d7d8f79addf782f5f78afdf.7d627e727f827da27eb27fc206894e7c4f8c"
 }
}

function olprint(txt,x,y,c)
 c=c or 7
 
 for yy=0,1 do
	 for xx=0,1 do
	  print(txt,x+xx,y+yy,0)
	 end
	end
	
	print(txt,x,y,c)
end

function wait(n,nodraw)
 if not nodraw then _draw() end
 for i=1,n do flip() end
end

--returns updated index based
--on buttons pressed (if any)
function btnsel(bdn,bup,val,low,high)
 if btnp(bdn) then
  val-=1
 elseif btnp(bup) then
  val+=1
 else
  return val
 end

 if val<low then val=high end
 if val>high then val=low end

 sfx(9)
 return val
end

--calculates countdown value
--for enemies that require one
--based on an x or y coordinate
function settmr(pos,tm)
 return flr(pos*(tm/16))%tm+1
end

--extreme token-saving measure
--eliminates third parameter
--in some cases, and + operator
--in others
function ssub(str,idx,len)
 len=len or 0
 return sub(str,idx,idx+len)
end

function blackout()
 camera()
 cls(0)
 wait(8,true)
end

function clearpal()
 pal()
 palt(0,false)
 palt(14,true)
end

clearpal()

--more obsessive token-saving
--as this gets used a lot
function flrd(a,b)
 return flr(a/b)
end

function clearcart()
 cntnu=0
 dset(0,0) --# stages complete
 dset(1,0) --weapon 1 active

 for i=2,6 do
  dset(i,-1)
 end
end

function _init()
 --[[
 copy dr. pico map string data
 from map memory into actutal
 string. this is necessary to
 get around compressed string
 space limitations
 ]]

	lvls[1].str=""

	for i=0x2000,0x2000+1964 do
	 lvls[1].str=lvls[1].str..ssub("0123456789abcdef./",peek(i))
	end
	
 cntnu=1

 if cartdata("funfetched_nanoman")==false then
  clearcart()
 end

 dotitle() 
end

function _update60()
 upcnt+=1

 --update speedrun timer
 if secs>=0 and upcnt%60==0 then
  secs=min(32766,secs+1)
 end

 screen_update() 
end

function _draw()
 screen_draw()
end

function dotitle()
 title_sel,title_selcnt,upcnt,
 screen_update,screen_draw=
 cntnu,0,0,
 title_update,title_draw

 music(2)
end

function domainmenu()
 blackout()
 music(4)
 menuitem(1)
 upcnt,menu_selcnt,
 menu_sx,menu_sy,
 screen_update,screen_draw=
 0,0,0,0,
 menu_update,menu_draw
end

function menu_update()
 if menu_selcnt==0 then
  menu_sx,menu_sy=
  btnsel(0,1,menu_sx,0,2),
  btnsel(2,3,menu_sy,0,1)
 end

 lvlsel=menu_sy*3+menu_sx+1

 if btnp(5) then
  if lvlsel>1 or dget(0)==5 then
	  music(-1)
	  sfx(10,3)
	  menu_selcnt=100
  end
 end

 if menu_selcnt>0 then
  menu_selcnt-=1

  if menu_selcnt==0 then
   dogame()
  end
 end
end

function menu_draw()
 for y=0,128,8 do
  for x=0,128,8 do
   local o=(upcnt%32)/4
   spr(198,x-o,y-o)
  end
 end

 map(48,19,0,24,16,10)
 local mx=16

 for i=1,6 do
  local x,y,rc,tc=
  ((i-1)%3)*40,
  flrd(i-1,3)*48,13,7

	 if dget(i)>-1 then
	  rc,tc=0,13
	 end

	 local n=weapons[i].."man"

	 if i==1 then
	  if dget(0)==5 then
    mx+=16
    n,rc,tc="dr. pico",13,7
   else
    n=""
   end
  end

	 olprint(n,x+24-#n*2,y+58,tc)

  if i==lvlsel then
		 if upcnt%16<8 then
		  map(26,16,x+8,y+24,4,4)
		 elseif menu_selcnt>0 then
		  rc=7
		 end
	 end

	 rectfill(x+15,y+31,x+32,y+48,rc)
 end

 map(mx,22,0,24,16,10)
 olprint("stage select",40,10,7)
end

function dogame()
 map_lvl,map_bg,cntnu=
 lvls[lvlsel],0,1

 if lvlsel>1 then
  map_bg=60+lvlsel*2
 end

 blackout()
 game_trap={}
 local i,str=0,map_lvl.str

 for s=1,#str do
  local c=ssub(str,s)

  if c=="/" then
   i+=1
   map_lvl[i]=""
  else
   map_lvl[i]=map_lvl[i]..c
  end
 end

 menuitem(1,"main menu",domainmenu)
 game_clearstuff()
 upcnt,plrwpn,camx,camy,
 maprow,vtrans,ready,
 upcnt,boss,bosscount,game_wb,
 plr,wpnstr=0,1,0,0,0,
 0,120,0,nil,0,0,nil,""
 map_drawrow(maprow)
 music(lvlsel*10-10,0,3)
 screen_update,screen_draw=
 game_update,game_draw
end

function drawstars()
 rectfill(0,0,128,128,0)
 local seed=rnd()
 srand(1)

 for i=1,100 do
  pset((rnd(128)-upcnt*((rnd()^2)*.75+.1))%128,rnd(128),6+(i%2)*7)
 end

 srand(seed)
end

function title_update()
 if title_selcnt==0 then
  title_sel=btnsel(2,3,title_sel,0,cntnu)

  if btnp(5) then
   title_selcnt=80 sfx(10) music(-1)
  end
 else
  title_selcnt-=1

  if title_selcnt==0 then
   if title_sel==0 then
    clearcart()
    secs=0
   end

   domainmenu()
  end
 end
end

function title_draw()
 drawstars()
 map(16,16,24,36,10,3)
 local txt={"new game","continue"}

 for i=0,cntnu do  
  if title_sel~=i or title_selcnt%16<8 then
   olprint(txt[i+1],48,75+i*10,7)
  end
 end

 olprint("—",37,75+title_sel*10,8)
 olprint("game created by @funfetched\nwith music by @gruber_music",10,116,13)
end

function pause_update()
 repeat
  plrwpn=btnsel(2,3,plrwpn,1,6)
 until getwpn()>-1

 if btnp(4,1) then
  screen_update,screen_draw,game_wb=
  game_update,game_draw,getwpn()
  sfx(13)
 end
end

function pause_draw()
 camera(-18,-24)
 rectfill(0,4,94,73,2)
 rect(1,5,93,72,7)

 for i=1,6 do
  local barlen=dget(i)

  if i==1 then
   barlen=plr.hp
  end

  if barlen>-1 then
   local by=i*10
   spr(i,14,by)
	  olprint(weapons[i],26,by+1,7)
	  rectfill(54,by,86,by+6,0)

   for b=1,barlen do
    local xx=54+b*2-1
    line(xx,by+1,xx,by+5,7)
   end
	 end

	 olprint(">",8,plrwpn*10+1,7)
 end
end

--insane token-saving stuff
--one whole token. yep.
function getwpn()
 return dget(plrwpn)
end

--draw health/energy bar
function vbar(x,y,pts,c)
 rectfill(x,y,x+6,y+32,0)

 for b=1,pts do
  local yy=y+33-b*2
  line(x+1,yy,x+5,yy,c)
 end
end

function hlthbarup(bar,pts)
 if bar<pts then
  bar=min(pts,bar+.15)
  if upcnt%4==0 then sfx(8) end
  game_delayed=true
 end

 return bar
end

function game_update()
 if bosscount>0 then
  bosscount-=1 

  if bosscount==60 then
   music(5,0,3)
  end 
 end

 --handle vertical screen
 --transition between map levels
 if vtrans~=0 then
  camy+=vtrans*2
  plr.y+=.25*vtrans

  if camy>=128 or camy<=-128 then
   game_trap={}
   maprow+=vtrans
   map_drawrow(maprow)
   plr.y-=128*vtrans
   if plr.f==6 then plr.dy=0 end
   vtrans,camy=0,0
   spwnenms(true)
   wait(20)
  end

  return
 end

 if ready>0 then
  ready-=1
  if ready>0 then return end
  plr=player_new(camx+56)
 end

 game_delayed=false

 if plr then
  plr:hlthbarup()
 end

 if boss and boss.sp==0 then
  boss:hlthbarup()
 end

 game_wb=hlthbarup(game_wb,getwpn())

 if not game_delayed then
  --update "bullets"
  for b in all(blts) do
   if b.update then
    b:update()
   end

   if b.player==true then
    for e in all(enms) do
     if game_vis(e) and
      rctcol(b:colrct(),e:colrct())
     then
      local h=e:hit(b)

      if h>0 and not b.persist then
       delblt(b)
      end

      if h==2 and not b.persist then
       sfx(12)
      end
     end
    end
   elseif plr and rctcol(b:colrct(),plr:colrct()) then
    if plr:hit(b) and not b.persist then
     delblt(b)
    end
   end

   b.x+=b.dx
   b.y+=b.dy
   b.ttl-=1

   if b.ttl==0 then delblt(b) end
  end

  if plr then plr:update() end

  --update enemies
  for e in all(enms) do
   if game_vis(e,true) or spwn[e.spi].vis then
    e:update()

    if plr and rctcol(e:colrct(),plr:colrct(),2) then
     if plr.dashing==0 then
      plr:hit(e)
     else
      e:hit(plr)
     end
    end
   end
  end

  if vtrans==0 then
   spwnenms(false)
  end

  foreach(fx,updateobj) 
  foreach(itms,updateobj)
 end

 if plr then
  local ocx=camx
  camx,camy=flr(mid(0,plr.x-56,128*7)),0

  --don't move camera off
  --edge of map
  if not map_ispointonmap(camx,maprow*128) then
   camx=flrd(ocx,128)*128
  end

  if not map_ispointonmap(camx+127,maprow*128) then
   camx=flrd(camx,128)*128
  end

  if vtrans==0 then
   if plr.y<0 and plr.f~=5 then
    vtrans=-1
   end

   if plr.y>111 then
    vtrans=1
   end
  end  

  if vtrans~=0 and map_ispointonmap(plr.x+8,(maprow+vtrans)*128) then
   wait(20)

   if vtrans==-1 then
    plr.y=-1
   else
    plr.y=112
   end

   map_drawpage(flrd(plr.x,128),maprow+vtrans,0,16)
  else
   vtrans=0

   if plr.y>128 then
    --fell into the abyss. die.
    music(-1) wait(30) plr:die()
   end
  end
 end

 if gocnt then
  gocnt-=1

  if gocnt==0 then
   gocnt=nil dogame()
  end
 end

 if drpicodie then
  drpicodie-=1
 end

 if bossdie then
  bossdie-=1

  if bossdie==280 then
   music(9)
  end

  if bossdie==0 then bossdie=nil
   if lvlsel==1 then
    for t in all(game_trap) do
     mset(t.x,t.y,0)
     sfx(12)
     wait(8)
    end

				music(0)
    plr.blts=0
   else
    domainmenu()
   end
  end
 end
end

function delblt(b)
 if b.player==true and b.wt==1 and plr then
  plr.blts-=1
 end

 if b.die then b:die() end
 del(blts,b)
end

function game_clearstuff()
 blts,enms,itms,pitms,spwn,fx=
 {},{},{},{},{},{}
 if plr then plr.blts=0 end
end

--spawn enemies
function spwnenms(force)
 --iterate through spawn points
 for i=1,#spwn do
  local s=spwn[i]
  local vis=abs(s.x*8-camx-60)<72

  --only spawn enemies when
  --spawn point is not visible
  if not s.e and (s.vis==vis or force) then
   if s.i<7 and not spawnboss(s.x*8) then
    return
   end

   s.e=enemies[s.i](s.x*8,s.y*8,i)
   add(enms,s.e)
  end
 end
end

function game_draw()
 camera()

 if bosscount<=60 and bosscount%12>6 then
  pal(0,6)
 end

 drawstars()
 camera(camx,camy)

 if vtrans~=0 then
  map(0,16,camx,vtrans*128,16,16)
 end

 map(0,0,0,0,128,16)
	clearpal()

 --draw map shadows
 local lft=flrd(camx,8)-1
 local rgt=lft+17
 
 for y=1,15+abs(vtrans*16) do
  for x=lft,rgt do
   if y~=16 then
	   local mx,dy=x,y
	
	   if y>16 then
	    mx-=lft+1
	    dy+=vtrans*16-16
	   end
	
	   local s=mget(mx,y)
	   
	   if band(fget(mget(mx,y-1)),0x5)>0 and s>0 and fget(s)==0 then
	    spr(233,x*8,dy*8)
	   end
	  end
  end
 end

 foreach(itms,drawobj)
 foreach(enms,drawobj)
 if plr then plr:draw() end
 foreach(blts,drawobj)
 foreach(fx,drawobj)
 camera()

 if plr then
  vbar(4,4,plr.hb,7)

  if plrwpn~=1 then
   vbar(10,4,game_wb,12)
  end
 end

 if boss then
  vbar(116,4,boss.hb,10)
 end

 if ready%16>7 then
  olprint("ready",54,61,7)
 end

 if bossdie and bossdie<220 and wpnstr~="" then
  olprint(wpnstr,64-#wpnstr*2,61,7)
 end

 if drpicotxt then
  olprint(drpicotxt,16,52,7)
 end
end

function updateobj(i)
 i:update()
end

function drawobj(i)
 i:draw()
end

function game_vis(o,ignore_y)
 local y=0
 if ignore_y then y=8192 end
 return rctcol(o:colrct(),{camx-4,-y,136,128+y*2})
end

--frame animation indices
frames="202122232425262728290001303122322433263428350203"

--build head coordinates table
hpos={}
hposstr="011211120111121211120111"

for i=1,#hposstr,2 do
 hpos[flrd(i,2)+1]={x=ssub(hposstr,i)-1,y=ssub(hposstr,i+1)-1}
end

--generic "man" class
function man_new(x,flp)
 local m={
  x=x,y=0,dx=0,dy=.05,
  jmp=2.25,spd=.225,pwr=4,
  f=1,af=0,flp=flp,
  g=0,gd=0,hf=0,hp=16,hb=0,
  cf=true,cj=false,bf=12,
  rf={2,3,4,3},sy=-32,sp=1,
  dashing=0,dashstreak=0
 }

 m.upcnt=0
 local l=false

 --find warp landing spot
 for y=0,15 do
  if fget(mget(flrd(m.x,8),y))>0 then
   if l==true then
    m.y=y*8-15 break
   end
  else
   l=true
  end
 end

 function m:hlthbarup()
  self.hb=hlthbarup(self.hb,self.hp)
 end

 function m:update()
  if self~=plr and bosscount>0 then
   return
  end

  --handle warp-in
  if self.sp>0 then
   if self.sp==1 then
    self.sy+=8

    if self.sy>=self.y then
     self.sy=self.y
     self.sp-=.1
     sfx(11)
    end
   elseif self.sp<1 then
    self.sp=max(0,self.sp-.1)
   end

   return
  end

  self.upcnt+=1

  --dashman's power
  if self.dashing~=0 then
   local s=sgn(self.dashing)
   self.dx=s*4.5
   self.dashing-=s

   if self.dashing==0 then
    self.dx=max(min(self.dx,self.sp),-self.sp)
   end

   self.dashstreak-=self.dx
  else
   self.dashstreak*=.7

   if abs(self.dashstreak)<4 then
    self.dashstreak=0
   end
  end

  self.x+=self.dx

  --camera contols the bounds
  if self.x<camx-4 then
   self.x=camx-4
  end

  if self.x>camx+116 then
   self.x=camx+116
  end

  local mx={}
  mx.f,mx.d,z=mapcol(self,0x81)

  if mx.f>0 then
   self.x-=sgn(self.dx)*mx.d self.dx=0
  end

  mx.f,mx.d,z=mapcol(self)
  self.dx*=.7

  self.y+=self.dy
  local my={}
  my.f,z,my.d=mapcol(self)

  local ladf,ladxd,ladyd=mapcol(self,2)

  --hitting spikes = death
  if band(my.f,4)==4 then
   self:explode()
  end

  --standing/running
  if self.f<=4 then
   self.dy=.05

   if band(my.f,1)==1 or (band(my.f,2)==2 and band(mx.f,2)==0) then
    self.y-=sgn(self.dy)*my.d
   end

   self.f=1 --default: standing

   if self:button(0) then
    self.dx-=self.spd
    self.f=2
    self.flp=true
   end

   if self:button(1) then
    self.dx+=self.spd
    self.f=2
    self.flp=false
   end

   if self.f~=1 then
    --do run animation
    self.af=(self.af+.175)%4
    self.f=self.rf[flr(self.af)+1]
   end

   if band(my.f,3)==0 then
    --no floor - begin falling
    self.f=5
   elseif self:button(4) and self.cj==true then
    --jump!
    self.dy=-self.jmp
    self.f,self.cj=5,false
    sfx(1)
   end

   if not self:button(4) then
    self.cj=true
   end
  elseif self.f==5 then
   --jumping/falling
   if band(my.f,1)==1 or (self.dy>0 and band(my.f,2)==2 and band(mx.f,2)==0) then
    --ran into something

    if self.dy<0 and my.d>4 then
     --forgot what this was for
     --but must be important!
     my.d-=4
    end

    self.y-=sgn(self.dy)*my.d

    if self.dy>0 then
     --falling, so we obviously
     --landed on the ground
     self.f,self.dy=1,.05
     sfx(2)

     if not self:button(4) then
      self.cj=true
     end
    else
     --not falling; hit head
     self.y+=.1
     self.dy=.05
    end
   elseif self.dashing==0 then
    self.dy=fall(self.dy)
   end   

   if self==plr and not self:button(4) and self.dy<0 then
    --player let go of button
    --during jump; cut upward
    --velocity in half
    self.dy*=.5
   end

   if self:button(0) then
    self.dx-=self.spd self.flp=true
   end

   if self:button(1) then
    self.dx+=self.spd self.flp=false
   end
  elseif self.f==6 then
   --climbing a ladder
   if self.dy<0 and band(my.f,1)==1 then
    self.y+=sgn(self.dy)*my.d+5
    self.dy=0
   end

   if self.g==0 then
    if self:button(2) then
     self.dy-=.2
     self.flp=self.y%8<4
    elseif self:button(3) then
     self.dy+=.2
     self.flp=self.y%8<4
    end
   end

   --left/right controls affect
   --which way we face when
   --we fire while on a ladder
   if self:button(0) then
    self.cf=true
   end

   if self:button(1) then
    self.cf=false
   end

   if self:button(4) or
    (band(my.f,2)==0 and self.dy>0)
   then
				--jump button pressed;
				--let go of ladder
    self.f,self.dy,self.flp=
    5,0,self.cf
   end   

   if self.dy>0 and band(my.f,1)==1 then
    --reached bottom of ladder
    self.y-=sgn(self.dy)*my.d
    self.f=1
   end

   if self.dy<0 and
    band(mfget(self.x+8,self.y+12),2)~=2 and
    band(mfget(self.x+8,self.y+4),2)==0
   then
    --reached top of ladder
    self.y,self.f=
    flrd(self.y,8)*8+1,1
   end

   self.dy*=.7

   if self.f==1 then
    --standing again; get
    --everything settled
    self.dy,self.flp=
    .05,self.cf
   end
  end

  if self.f~=6 then
   --not climbing ladder, so...
   if(self:button(2) and ladyd>=1) or
    (self:button(3) and ladyd<1)
   then
    --look for ladder to climb
    --local f,xd,yd=mapcol(self,2)

    if ladxd>3 then
     --start climbing
     self.x,self.f,self.dx,
     self.dy,self.cf=
     flrd(self.x,8)*8+4,6,0,0,self.flp

     if not self:button(2) and self:button(3) then
      --climbing down
      self.y+=4
     end
    end
   end
  end

  if self:button(5) and self.gd==0 then
   --fire!
   self.g=20 --pose countdown
   local x,dx
   local y=self.y+7

   if self.f==6 then
    --on a ladder; flip
    --appropriately
    self.flp,self.dy=self.cf,0
   end

   if self.flp then
    x,dx=self.x,-1
   else
    x,dx=self.x+15,1
   end

   if self.f==5 or self.f==6 then
    --re-align gun coordinates
    y-=1
   end

   self:fire(x,y,dx,dy)
  end 

  if self.gd>0 then
   if not self:button(5) or self.gd>1 then
    self.gd-=1
   end
  end

  if self.g>0 then
   self.g-=1
  end

  self.hf=max(0,self.hf-1)
 end

 function m:fire(x,y,dx,dy)
  local wpn,isplr=
  self.id,self==plr

  if isplr then wpn=plrwpn end
  if wpn==3 then wpn=1 end

  if isplr then
	  if getwpn()<wpndrn[wpn] then
	   --weapon energy is drained
	   return
	  end

	  dset(plrwpn,getwpn()-wpndrn[wpn])
	  game_wb=getwpn()
  end 

  if wpn==1 then
   --normal "nano" gun
   if not isplr or self.blts<3 then
	   local b=blt_new(x,y+1,dx*2.5,0,0,isplr)
	   b.sp,b.wt,b.pwr,b.ttl,b.player=
	   11,1,1,48,isplr
		  self.gd=2
		  if isplr then self.blts+=1 end
		 end
  elseif wpn==2 then
   laser_new(x,y,dx,isplr)
   self.gd=30
  elseif wpn==4 then
   self.dashing=12

   if self.flp==true then
    self.dashing=-12
   end

   self.dashstreak=0
   self.gd,self.dy=30,0
   self.y-=1
   sfx(3)
  elseif wpn==5 then
   seeker_new(x,y,dx,isplr)
   self.gd=30
  elseif wpn==6 then
   hammer_new(x,y,dx,isplr)
   self.gd=30
  end
 end

 function m:draw()
  local wpn=self:getwpntype()
  local head=self.id
  pal(13,darkcol[wpn]) pal(6,lightcol[wpn])

  --draw warping stuff
  if self.sp>0 then
   if self.sp==1 then
    spr(203,self.x+4,self.sy,1,2)
   else
    local s=204

    if self.sp<.5 then
     s=206
    end

    spr(s,self.x,self.y,2,2)
   end   
   return
  end

  local f=self.f

  if self.g>0 then
   f+=6 --do firing pose
  end
  
  if self.hf%4>1 then
   pal(0,7) --flash when hit
  end

  local xo,ff=-1,(f-1)*4+1

  if self.flp then xo=1 end

  spr(ssub(frames,ff,1)+self.bf,self.x+xo*4+4,self.y,1,2,self.flp)
  spr(ssub(frames,ff+2,1)+self.bf,self.x-xo*4+4,self.y,1,2,self.flp)

  --draw the appropriate head
  if f~=6 and f~=12 then
   if self~=plr then clearpal() end
   if self.hf%4>1 then pal(0,7) end
   spr(head,self.x+4+hpos[f].x*-xo,self.y+hpos[f].y,1,1,self.flp)
  end

  clearpal()

  if self.dashstreak~=0 then
   sspr(64,64,16,16,self.x+8-sgn(self.dashstreak),self.y,self.dashstreak,16)
  end
 end

 function m:colrct()
  return {self.x+5,self.y+1,6,15}
 end

 --specific to bosses
 --overridden in player class
 function m:hit(o)
  if o==plr then
   if plr.dashing==0 then
    return 0
   end
  else
   if not o.player or self.dashing~=0 then
    return 0
   end
  end

  --invulnerable while flashing
  if self.hf>0 then return 0 end

  self.hp-=o.pwr*(ssub(self.vuln,o.wt*4,2)+0)
  self.hb,self.hf=self.hp,20
  sfx(4)

  if self.hp<=0 then
   self:explode()
  end

  return 1
 end

 function m:explode()
  music(-1)
  blts={}
  wait(30)
  local x,y,wpn=
  self.x+7.5,self.y+7.5,

  --colorize explosion by
  --character class
  self:getwpntype()
  exp_new(x,y,10,lightcol[wpn])

  for a=0,.875,.125 do
   exp_new(x,y,3,lightcol[wpn],64,cos(a)*1.5,sin(a)*1.5)
  end

  self:die()
 end

 --specific to bosses
 --overridden in player class
 function m:die()
  sfx(5)
  local wpn=self:getwpntype()

  if dget(wpn)==-1 then
   wpnstr=weapons[wpn].." acquired"
   dset(0,dget(0)+1)
  end

  dset(wpn,16)
  del(enms,self)
  bossdie,boss=360,nil
 end

 function m:getwpntype()
  if self==plr then
   return plrwpn
  end

  return self.id
 end 

 return m
end

function player_new(x,flp)
 p=man_new(x,flp)
 p.id,p.hb,p.wt,p.blts,p.vuln=
 1,16,4,0,
 --vulnerability factors to
 --different types of weapon
 "   4.0,016,1.0,1.0,1.0,1.0"


 function p:hlthup(sp)
  local hp,wp=0,0  
  if sp==16 then hp=8 end
  if sp==22 then hp=2 end
  if sp==19 then wp=8 end
  if sp==25 then wp=2 end
  self.hp=min(self.hp+hp,16)

  if plrwpn~=1 then
   dset(plrwpn,min(getwpn()+wp,16))
  end
 end

 function p:hit(o)
  --invulnerable while flashing
  --or dashing
  if self.hf>0 or self.dashing>0 then
   return 0
  end

  local dmg=o.pwr

  if o.wt then
   --hit by a weapon as opposed
   --to a character/enemy
   dmg*=(ssub(self.vuln,o.wt*4,2)+0)
  end

  --armorman takes damage to
  --weapon energy bar first
  if plrwpn==3 then
   local dep=min(dget(3),dmg*2)
   dmg=max(0,dmg-dep/2)
   dset(3,max(dget(3)-dep,0))
   game_wb-=dep
  end

  --figure out which way to
  --get knocked back
  local cx,cy=ecntr(self)
  local ox,oy=ecntr(o)
  local s=sgn(cx-ox)

  if o.wt==2 then
   s=sgn(o.x-(self.x+8))
  end

  if self.f<=4 then
   self.dy=-1
  else
   self.dy=0
  end

  sfx(7)
  self.hp-=dmg
  self.hb,self.hf,self.dx,
  self.flp,self.f,self.cj=
  self.hp,100,s*4,s==1,5,false

  if self.hp<=0 then
   self:explode()
  end

  return 1
 end

 function p:die()
  sfx(5)
  plr,gocnt=nil,180
 end

 function p:button(i)
  --use player 2's button 4
  --to open weapons menu
  if btnp(4,1) then
		 screen_update,screen_draw=
		 pause_update,pause_draw
		 sfx(13)
  end

  if self.hf<80 and (not boss or boss.sp==0) then
   return btn(i)
  else
   return false
  end
 end

 return p
end

--generic boss class
function bossman_new(x,flp)
 b=man_new(x,flp)

 function b:button(b)
  --button inputs controlled
  --by "script" information
  --contained in strings
  local i=flrd(self.upcnt,10)%#self.moves+1

  --scripts broken up into
  --movements and actions
  local mc,ac=
  ssub(self.moves,i),
  ssub(self.acts,i)  

  if mc~="." then
   if b==mc+0 then
    return true
   end
  elseif plr and self.id~=6 then
   --hammerman doesn't
   --automatically face player
   self.flp=self.x>plr.x
  end

  if ac~="." and b==ac+0 then
   return true
  end

  return false
 end

 return b
end

function drpico_new(x,flp)
 if not spawnboss(x) then
  return
 end

 boss=bossman_new(x,flp)
 boss.hp,boss.frame,
 boss.moves,boss.acts,
 boss.vuln=
 16,128,
 ".",".",
 "   999,999,999,999,999,999"

 function boss:update()
  if bosscount==60 then
   self.sp,drpicotxt=0,"fool! you can't stop me\n\n    i created you!"
  end

  if drpicodie==120 then
   self.frame=132
  elseif drpicodie==0 then
		 blackout()
   print("the end!",48,60,7)
   music(9)
   
   wait(100,true)

   if secs>=0 then
    local ts="(time: "..flr(secs/60)..":"..secs%60 .."."..flr((upcnt%60)*1.66)..")"
    print(ts,64-#ts*2,96,13)
   end
   
   wait(500,true)
   blackout()
   dotitle()
  end
 end

 function boss:draw()
  spr(self.frame,self.x,self.y,2,2)
 end

 function boss:hit(o)
  if self.frame~=128 then
   return 0
  end
  self.hp,self.hb,self.frame,self.dx,drpicodie,drpicotxt=0,0,130,1,240,""
  music(-1)
  sfx(17)
  return 1
 end

 return boss
end

function laserman_new(x,flp)
 boss=bossman_new(x,flp)
 boss.id,boss.spd,
 boss.vuln,
 boss.moves,
 boss.acts=
 2,.5,
 --  nan,las,arm,dsh,sek,ham
 "   1.0,4.0,1.0,0.5,0.5,0.5",
 ".......00000......11111",
 ".5...........5....4...."

 return boss
end

function armorman_new(x,flp)
 boss=bossman_new(x,flp)
 boss.id,
 boss.vuln,
 boss.moves,
 boss.acts=
 3,
 --  nan,las,arm,dsh,sek,ham
 "   0.5,2.0,0.5,0.5,0.5,.75",
 ".......000000000.......111111111",
 ".....5.5.5.5.44......5.5.5.5.44."

 return boss
end

function dashman_new(x,flp)
 boss=bossman_new(x,flp)
 boss.id,
 boss.vuln,
 boss.moves,
 boss.acts=
 4,
 --  nan,las,arm,dsh,sek,ham
 "   1.0,012,1.0,.25,0.5,0.5",
 ".........................",
 "..5..445....5....5..445.."

 return boss
end

function seekman_new(x,flp)
 boss=bossman_new(x,flp)
 boss.id,
 boss.vuln,
 boss.moves,
 boss.acts=
 5,
 --  nan,las,arm,dsh,sek,ham
 "   1.0,4.0,1.0,.75,.25,0.5",
 "......0000000000......1111111111",
 "..5...............5............."

 return boss
end

function hammerman_new(x,flp)
 boss=bossman_new(x,flp)
 boss.id,boss.spd,boss.jmp,
 boss.vuln,
 boss.moves,
 boss.acts=
 6,.24,2,
 --  nan,las,arm,dsh,sek,ham
 "   1.0,4.0,1.0,0.5,1.7,.25",
 "0000......11..1111......00..",
 "4.....5..4..454.....5..4..45"

 return boss
end

function spawnboss(x)
 --not if we can't see him!
 if not plr or flrd(plr.x,128)~=flrd(x,128) then
  return false
 end

 plr.flp,bosscount=false,120
 music(-1)
 return true
end

--one generic enemy class
--to rule them all
function enemy_new(x,y,spi)
 e={
  x=x,y=y,dx=0,dy=0,hf=0,
  upcnt=0,pwr=2,hp=1,spi=spi
 }

 function e:move()
  self.upcnt+=1
  self.hf=max(0,self.hf-1)
  local cx,cy=false,false
  self.x+=self.dx

  --left and right collisions
  if self.wallcol then
   local f,xd,yd=mapcol(self,1)

   if f==1 then
    --move to edge of collision
    self.x-=sgn(self.dx)*xd
    cx=true
   end
  end

  self.y+=self.dy

  --top and bottom collisions
  if self.wallcol then
   local f,xd,yd=mapcol(self,1)
   if f==1 then
    self.y-=sgn(self.dy)*yd cy=true
   end
  end

  return cx,cy
 end

 function e:hit(o)
  if self.inv==true then
   sfx(12) return 2
  end

  self.hf=14
  self.hp-=o.pwr
  sfx(4)

  if self.hp<=0 then
   self:explode()
  end

  return 1
 end

 function e:explode()
  spwn[self.spi].e=nil
  del(enms,self)
  doenmexp(self)
 end

 function e:colrct()
  return {self.x,self.y,8,8}
 end

 function e:flash()
  if self.hf>0 and flr(self.hf)%4<3 then
   pal(0,7)
  end
 end

 return e
end

--little green jumping jerks
function springer_new(x,y,spi)
 local s=enemy_new(x,y+1,spi)
 s.hp,s.pwr,s.jt,s.inv,
 s.wallcol=2,2,0,true,true

 function s:update()
  self.jt=max(0,self.jt-1)
  local cx,cy=self:move()

  if self.inv and cy then
   self.dx*=.7

   if plr then
    local dx,dy=plr.x-self.x,plr.y-self.y

    if vlen(dx,dy)<32 and self.jt==0 then
     self.inv,self.dy,self.dx=
     false,-1.75,
     min(.65,max(-.65,dx/40+plr.dx*.5))
     sfx(1)
    end
   end
  else
   if cy then
    if self.dy>0 then
     self.inv=true self.jt=16
    else
     self.y+=.1
     self.dy=.05
    end
   end

   self.dy=fall(self.dy)
  end
 end

 function s:draw()
  self:flash()

  if self.inv then
   spr(217,self.x,self.y,1,1,sgn(self.dx))
  else
   spr(218,self.x,self.y-8,1,2,sgn(self.dx))
  end

  clearpal()
 end

 function s:colrct()
  if self.inv then 
   return {self.x,self.y,8,8}
  else
   return {self.x,self.y-8,8,16}
  end
 end

 return s
end

--you know, the spiky things
--that move back and forth
function mine_new(x,y,spi)
 local e=enemy_new(x,y,spi) 
 e.hp,e.wallcol,e.sp=
 10,true,spwn[spi].i

 if e.sp==255 then
  e.tmr,e.ddx,e.ddy=
  settmr(y,103),1,0
 else
  e.tmr,e.ddx,e.ddy=
  settmr(x,103),0,1
 end

 function e:update()
  self.tmr=max(0,self.tmr-1)

  if self.tmr==0 then
   self.dx,self.dy=self.ddx,self.ddy
  end

  local cx,cy=self:move()

  if cx or cy then
   self.ddx*=-1
   self.ddy*=-1
   self.dx,self.dy,self.tmr=
   0,0,104
   sfx(12)
  end
 end

 function e:draw()
  self:flash()
  spr(self.sp,self.x,self.y)
  clearpal()
 end

 return e
end

--wall-crawling thing that
--shoots bullets, not beams
--i wanted beams, but didn't
--have enough tokens!
function beamer_new(x,y,spi)
 local e=enemy_new(x,y,spi)
 e.hp,e.tmr,e.wallcol,e.sp,
 e.dx,e.dy,e.hflp,e.vflp,
 e.fdx,e.fdy=
 3,settmr(x+y,59),true,spwn[spi].i,
 0,0,false,false,0,0

 --set orientation of enemy
 --according to sprite index
 --found in map data
 if e.sp<196 then
  e.dy,e.fdx=.5,2
 else
  e.dx,e.fdy=.5,-2
 end

 if e.sp==195 then
  e.sp-=1 e.dy*=-1 e.fdx*=-1 e.hflp=true
 end

 if e.sp==197 then
  e.sp-=1 e.dx*=-1 e.fdy*=-1 e.vflp=true
 end

 function e:update()
  self.tmr=max(0,self.tmr-1)

  if self.tmr==0 then
   blt_new(self.x+self.fdx*2+2.5,self.y+self.fdy*2+2.5,e.fdx,e.fdy)
   self.tmr=60
  end

  local cx,cy=self:move()

  if cx or cy then
   self.dx*=-1 self.dy*=-1
  end
 end 

 function e:draw()
  self:flash()
  spr(self.sp+(self.tmr/4)%2,self.x,self.y,1,1,self.hflp,self.vflp)
  clearpal()
 end

 return e
end

--spinning, bullet-crazed
--orb of death
function cyco_new(x,y,spi)
 local e=enemy_new(x,y,spi)
 e.cntr,e.hp=
 flrd(x,128)*128+64,6
 e.radius,e.ang=
 vlen(x-e.cntr,y-64),
 atan2(x-e.cntr,y-64)

 function e:update()
  self.x,self.y=cos(e.ang)*e.radius+e.cntr-4,sin(e.ang)*e.radius+60
  e.ang+=.075/e.radius

  if self.upcnt%40==0 then
   for a=0,1,.25 do
    local aa=a-self.upcnt/100
    local x,y=cos(aa),sin(aa)
    blt_new(self.x+4+x*6,self.y+4+y*6,x,y)
   end
  end

  self:move()
 end

 function e:draw()
  self:flash()

  for a=0,1,.25 do
   spr(251,self.x+cos(a-self.upcnt/100)*4,self.y+sin(a-self.upcnt/100)*4)
  end

  spr(250,self.x,self.y)
  clearpal()
 end
 return e
end

--jumps out of bottom of screen
--and fires a spread of bullets
function popper_new(x,y,spi)
 local e=enemy_new(x,y,spi)
 e.hp,e.alt,e.y,e.dy=
 4,y,128,-1.5

 function e:update()
  if self.dy~=-1.5 then
   self.dy=fall(self.dy)

   if self.y>256 then
    self.y,self.dy=128,-1.5
   end     
  else
   sfx(15,-1,30)

   if self.y<=e.alt then
    self.dy=-.995
    for dx=-1,1,.66 do
     blt_new(self.x+3.5,self.y,dx,-1.5,.1)
    end
   end
  end

  self:move()
 end

 function e:draw()
  if self.dy==-1.5 then
   spr(235,self.x,self.y+8-(self.upcnt*.5)%3)
  end

  self:flash()
  spr(252+(self.upcnt*.3)%3,self.x,self.y)
  clearpal()
 end

 return e
end

--homage to flaapy bird
--because eff that game
function bird_new(x,y,spi)
 local e=enemy_new(x,y,spi) 
 e.hp,e.yb,e.dx,e.x=
 1,y,-1,camx+172
 e.upcnt+=y

 --if sprite index on map is
 --other frame of bird, start
 --from other side of screen
 if spwn[spi].i==237 then
  e.dx,e.x=1,camx-84
 end
 
 e.x+=x%40

 function e:update()
  self.y=sin(self.upcnt*.0175)*15+e.yb
  self:move()

  if(self.x<camx-32 and self.dx<0) or (self.x>camx+160 and self.dx>0) then
   self:explode()
  end
 end

 function e:draw()
  spr(237+(self.upcnt*.2)%2,self.x,self.y,1,1,self.dx<0)
 end

 return e
end

--big, bronze crusher thing
function smasher_new(x,y,spi)
 local e=enemy_new(x,y,spi)
 e.inv,e.wallcol,e.tmr,e.oy,e.pwr=
 true,true,settmr(x/2,39),y,4

 function e:update()
  local cx,cy=self:move()

  if cy then
   if self.dy>0 then
    self.dy=-1
    sfx(16)
   else
    e.tmr,self.dy=40,0
   end
  end

  if e.tmr>0 then
   e.tmr-=1

   if e.tmr==0 then
    self.dy=4
   end
  end
 end

 function e:draw()
  sspr(104,64,8,8,self.x+4,self.oy,8,self.y-self.oy)
  spr(150,self.x,self.y,2,1)
 end

 function e:colrct()
  return {self.x,self.y,16,8}
 end

 return e
end

--creates health item. handles
--both life and weapon energy
function hlth_new(x,y,sp,decay)
 --bail if attempting to spawn
 --inside an occupied map cel
 if mfget(x,y)~=0 then
  return
 end

 local h={
  x=flrd(x,8)*8,y=y,dy=-1,
  sp=sp,ttl=360,
  decay=decay
 }

 function h:update()
  self.y+=max(0,self.dy)  

  --decay is true if we want
  --item to disappear over time
  if self.decay then
	  self.dy=fall(self.dy)
	  local f,xd,yd=mapcol(self,1)

	  if f==1 then
	   self.y-=yd self.dy=0
	  end

   self.ttl-=1

   if self.ttl==0 then
    del(itms,self) return
   end
  end

  if plr and rctcol(self:colrct(),plr:colrct()) then
   plr:hlthup(self.sp)
   del(itms,self)
   return 
  end
 end

 function h:draw()  
  if self.ttl>140 or self.ttl%10<5 then
   spr(self.sp+(upcnt/12)%3,self.x,self.y)
  end
 end

 function h:colrct()
  return {self.x,self.y,8,8}
 end

 add(itms,h)
 return h
end

--hash table of constructors
--to call when spawning things
--from map data. keyed by sprite
--index, for the most part

enemies={
 [1]=drpico_new,
 [2]=laserman_new,
 [3]=armorman_new,
 [4]=dashman_new,
 [5]=seekman_new,
 [6]=hammerman_new,
 [217]=springer_new,
 [239]=mine_new,
 [255]=mine_new,
 [250]=cyco_new,
 [252]=popper_new,
 [237]=bird_new,
 [238]=bird_new,
 [194]=beamer_new,
 [195]=beamer_new,
 [196]=beamer_new,
 [197]=beamer_new,
 [150]=smasher_new
}

items={
 [16]=hlth_new,
 [19]=hlth_new
}

--generic explosion
function exp_new(x,y,r,c,ttl,dx,dy)
 local e={x=x,y=y,r=r,c={7,c},ttl=ttl,dx=dx,dy=dy}
 e.dx=dx or 0
 e.dy=dy or 0
 e.ttl=ttl or 0

 function e:update()
  self.x+=self.dx
  self.y+=self.dy  

  if self.ttl>0 then
   self.ttl-=1

   if self.ttl==0 then
    del(fx,self)
   end
  else
   self.r-=.25

   if self.r==0 then
    del(fx,self)
   end
  end
 end

 function e:draw()
  local r=self.r

  if self.ttl>0 then
   r=self.ttl*.5
  end

  circfill(self.x,self.y,self.r+cos(r/3)*2,self.c[flr(r)%2+1])
 end

 add(fx,e)
 return e
end

--create enemy explosion
function doenmexp(e)
 local rx,ry,rw,rh=rct(e:colrct())
 local x,y=ecntr(e)
 exp_new(x,y,max(rw/2,rh/2),8)

 if plr and rnd()>.67 then
  local s=16
  if rnd()<.5 then s+=3 end --energy
  if rnd()>.33 then s+=6 end --small
  hlth_new(x,y,s,true)
 end
end

function blt_new(x,y,dx,dy,grav,isplr)
 b={
  x=x-2.5,y=y-2.5,dx=dx,dy=dy,
  ttl=128,pwr=2,grav=grav or 0,sp=140
 }

 function b:update()
  self.dy=min(3.5,self.dy+self.grav)
 end

 function b:draw()
  spr(self.sp,self.x,self.y)
 end

 function b:colrct()
  return {self.x+1,self.y+1,4,4}
 end

 if isplr then
  sfx(0)
 else
  sfx(6)
 end

 add(blts,b)
 return b
end

function laser_new(x,y,dx,player)
 b={
  x=x,y=y,dx=dx*.25,dy=0,wt=2,
  player=player,persist=true,
  ttl=60,pwr=.25,xlen=0
 } 

 if player then b.ttl=44 end

 function b:update()
  if self.ttl==42 then
   self.dx*=32
  end

  if self.ttl>16 and self.ttl<44 then
   self.xlen-=self.dx
  end
 end

 function b:draw()
  local x,y,x1,coff=
  self.x,self.y,
  self.x+self.xlen,
  (self.ttl/4)%2
  line(x,y,x1,y,10)
	 line(x,y-1,x1,y-1,8+coff)
	 line(x,y+1,x1,y+1,9.99-coff)
  circfill(self.x+self.xlen+rnd(3)-1,self.y,(self.ttl-8)/8,7)
 end

 function b:colrct()
  return {min(self.x,self.x+self.xlen),self.y-1,abs(self.xlen),2}
 end

 sfx(14)
 add(blts,b)
 return b
end

function seeker_new(x,y,dx,player)
 b={
  x=x,y=y,dx=0,dy=0,ang=0,wt=5,
  ttl=180,pwr=2,player=player,
  trgt=nil,trgtdist=32768
 }

 if dx<0 then b.ang=.5 end

 function b:findtarget()
  local closest_d,closest_e=32767,nil

  if self.player then
   for e in all(enms) do
    if game_vis(e) then 
	    local d=vlen(ecntr(e),self.x,self.y)

	    if d<closest_d then
	     closest_d,closest_e=d,e
	    end
	   end
   end
  else
   return plr,closest_d
  end  

  return closest_e,closest_d
 end

 function b:update()
  local t,d=self:findtarget()

  if d<self.trgtdist*.9 then
   self.trgt=t self.trgtdist=d
  end

  if t then
   local ex,ey=ecntr(t)
  	local delta,a=1,atan2(ex-self.x,ey-self.y)

   if abs(a-self.ang)>.5 then
    delta=-1
   end

   if self.ang<a then
    self.ang+=.01*delta
   else
    self.ang-=.01*delta
   end

	  self.ang%=1
	 end

  self.dx,self.dy=
  cos(self.ang)*1.5,
  sin(self.ang)*1.5
 end

 function b:draw()
  local a,xx,yy=
  ((self.ang+.06)%1)*8,
  self.x-3.5,self.y-3.5
  spr(134+(upcnt/4)%2,xx-self.dx*3,yy-self.dy*3)
  spr(7+a%4,xx,yy,1,1,a>2 and a<6,a>4)
 end

 function b:colrct()
  return {self.x-2,self.y-2,4,4}
 end

 function b:die()
  exp_new(self.x,self.y,4,10)
 end

 sfx(15)
 add(blts,b)
 return b
end

function hammer_new(x,y,dx,player)
 b={
  x=x-8+dx*8,y=y-7,dx=0,dy=0,wt=6,
  player=player,persist=true,
  ttl=20,pwr=4,flp=dx<0
 }

 function b:draw()
  spr(142,self.x,self.y,2,2,self.flp)

  if self.ttl>=10 then
   if self.ttl<15 then
    spr(156,self.x,self.y-8,2,1,self.flp)
   else
    spr(138,self.x,self.y-16,2,2,self.flp)
   end
  end
 end

 function b:colrct()
  return {self.x,self.y,16,16}
 end

 sfx(16)
 add(blts,b)
 return b
end

--returns flag of map cel at
--x,y screen coordinates
--(not what you thought it was)
function mfget(x,y)
 return fget(mget(flrd(x,8),flrd(y,8)))
end

--a horrific mess that detects
--collisions between objects
--and the map
function mapcol(o,msk)
 local rx,ry,rw,rh=rct(o:colrct())
 rh-=1
 local f,xd,yd=0,0,0
 msk=msk or 255

 --iterate through
 --surrounding map cels
 for x=rx,rx+rw+7,8 do
  for y=ry,min(ry+rh+7,127),8 do
   --convert x,y to map coords
   local mx,my=
   flrd(x,8),flrd(y,8)

	  --get rounded screen coords
	  --of map cels and cel flag
   local fx,fy,ff=
   mx*8,my*8,fget(mget(mx,my))

   if band(ff,msk)~=0 then
    --calculate how much
    --overlap there is if any
    local lxd,lyd=min(rx+rw-fx,fx+8-rx),min(ry+rh-fy,fy+7-ry)
    
		  if lxd>0 and lyd>0 then
     f=bor(f,ff)
     
     --update delta of x and
     --y overlap values
     xd,yd=lxd,lyd
    end
   end
  end
 end

 return f,xd,yd
end

--return the x/y overlaps of two
--rectangles if overlap exists

--o: offset to force a smaller
--area of collision. used to
--make enemy->player collisions
--less finicky
function rctcol(a,b,o)
 o=o or 0
 local ax,ay,aw,ah=rct(a)
 local bx,by,bw,bh=rct(b)
 local xd,yd=
  min(ax+aw-bx,bx+bw-ax),
  min(ay+ah-by,by+bh-ay)

 if xd>0+o and yd>0+o then
  return xd,yd
 end

 return
end

--expand rectangle table
function rct(r)
 return r[1],r[2],r[3],r[4]
end

--returns center of anything
--with a collision rectangle
function ecntr(e)
 local r=e:colrct()
 return r[1]+r[3]/2,r[2]+r[4]/2
end

--standard vector length calc
function vlen(x,y)
	return sqrt(x*x+y*y)
end

--save tokens by re-using this
--formula for all gravity calcs
function fall(dy)
 return min(dy+.1,3.5)
end

function map_ispointonmap(x,y)
 return mget(map_lvl.x+flrd(x,128),map_lvl.y+flrd(y,128))>0
end

function map_drawrow(row)
 game_clearstuff()
 local x=camx+128

 repeat
  x-=128
 until not map_ispointonmap(x-128,row*128)

 for col=0,7 do
  if not map_ispointonmap(x+col*128,row*128) then
   break
  end

  map_drawpage(flrd(x,128)+col,row)
 end
end

--[[
decompresses map data on a
"per page" basis (16x16)
compressed map data consists
of strings of hex digits

two modes of compression:
1. example: 08249f
 defines filled rectangle,
 drawing tile 0x08 from
 0x2,0x4 to 0x9,0xf

2. example: 08ab
 defines single cel, used
 for single cel decorations
 as well as enemy spawn points
 
 in this case, it would be
 tile 0x08, located at 0xa,0xb

pages are divided by slashes,
while the mode shifts from 1
to 2 when when a period "."
is encountered
]]
function map_drawpage(col,row,ox,oy)
 if not ox then
  ox,oy=col*16,0
 end

 --determine the "page" to get
 local pg=mget(col+map_lvl.x,row+map_lvl.y)

 if pg==0 then return end

 function parse(str)
  local r={("0x"..sub(str,1,2))+0}

  for i=3,#str do
   r[i-1]=("0x"..ssub(str,i))+0
  end

  return r
 end

 --draw stage background
	for bx=0,15 do
	 for by=0,15 do
	  local bg=0

	  if map_bg>0 then
	   bg=map_bg+bx%2+(by%2)*16
	  end

	  mset(bx+ox,by+oy,bg)
	 end
	end

 --draw map tiles
 local i,mode,str=1,1,map_lvl[pg]

 repeat
  if ssub(str,i)=="." then
   --switch to single-tile mode
   mode+=1
   i+=1
  else
   if mode==1 then
    local st=parse(ssub(str,i,5))
    local t,x,y,rx,ry=st[1],st[2],st[3],st[4],st[5]

    --fill rectangle
    for yy=y,ry do
     for xx=x,rx do
      local tx,ty=xx+ox,yy+oy
      mset(tx,ty,t)

      if t==76 then
       add(game_trap,{x=tx,y=ty})
      end
     end
    end

    i+=6
   else
    --mode 2: single cel
    st=parse(ssub(str,i,3))
    local t,x,y=st[1],st[2],st[3]

    --look up tile number in
    --enemy and item hash tables
    --if found, add spawn point
    if enemies[t]~=nil then
     add(spwn,{i=t,x=x+ox,y=y,e=nil,vis=t==237 or t==238})
    elseif items[t]~=nil then
     items[t]((x+ox)*8,(y+oy)*8,t)
    else
     --not in hash tables
     --draw single cell
     mset(x+ox,y+oy,t)
    end

    i+=4
   end
  end
 until i>=#str
end
__gfx__
eeeeeeeeeee000eeee00000ee000000ee0e000eeee0000eee000000eeeeeeeeeeeeee00eeee00eeeeeeee00eeeeeeeeeeee00e0000eeeeeeeee00e0000eeeeee
eeeeeeeeee066d0ee099202000d666000a0ccc0ee033bb0e02449940e0000eeeeee00aa0ee0aa0eeeee00aa0e0000eeeee0dd066dd0eeeeeee0dd066660eeeee
ee7ee7eee0dd06d0022990900d6d67600aaaaca003333bb0024499400333300eee03b3a0ee0330eeee03b3a0077770eeee0d0d66ddd0eeeeee0d06dddd60eeee
eee77eee06ddddd0022290900d0d66600000aca00030000000000000e03bb3a0e03bbb0ee03bb30ee03bbb0e077770eeee0d0d66ddd0eeeeee0d0dddddd0eeee
eee77eee06d70d000000080000d000000cc70a0003008990024f0900e03bb3a00333b30ee03bb30e0333b30ee0000eeeee060d66dd6000eeee06066d70d0eeee
ee7ee7eee0d70f00e0229090e0dd60600cc70f00e0300000024499400333300ee00330eee033330ee00330eeeeeeeeeeee060ddddd60d0eeee06066d70f0000e
eeeeeeeeee0dfff0ee099090ee0dd0d0e0cffff0ee033330e0249940e0000eeeee030eeee030030eee030eeeeeeeeeeeeee060dddd00d0eeeee060dddff0ddd0
eeeeeeeeeee0000eeee0000eeee0000eee00000eeee0000eee00000eeeeeeeeeeee0eeeeee0ee0eeeee0eeeeeeeeeeeeeeee0600006660eeeeee060006666dd0
ee0000eeee6666eeee0000eee111111ee777777eecccccceeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee066666600eeeeeee06666660000e
e077770ee600006ee066660e1e1cc1e17e7117e7cec77ceceeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee0d0ddddd0eeeeeee0d0ddddd0eeee
07700770600770060660066011ecce1177e11e77cce77eccee0000eeee7777eeee0000eeee1111eeee7777eeeecccceeeee0d66ddd60eeeeeee0d66ddd60eeee
0706607060700706060770601cc77cc1711cc117c771177ce007700ee770077ee007700ee1ecce1ee7e11e7eece77eceeee000000660eeeeeee000000660eeee
0706607060700706060770601cc77cc1711cc117c771177ce077770ee700007ee077770ee1c77c1ee71cc17eec7117ceeeeeeeee0660eeeeeeeeeeee0660eeee
07700770600770060660066011ecce1177e11e77cce77ecce077770ee700007ee077770ee1c77c1ee71cc17eec7117ceeeeeeeee0dd0eeeeeeeeeeee0dd0eeee
e077770ee600006ee066660e1e1cc1e17e7117e7cec77cece007700ee770077ee007700ee1ecce1ee7e11e7eece77eceeeeeeeee0dd0eeeeeeeeeeee0dd0eeee
ee0000eeee6666eeee0000eee111111ee777777eecccccceee0000eeee7777eeee0000eeee1111eeee7777eeeecccceeeeeeeeee0000eeeeeeeeeeee0000eeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee00eeeeeeeee00eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee0dd0eeeeeee0dd0eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee0dd0eeeeeee0dd0eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eee000eeeeeeeeeeeeeeeeeeeeeeeeeeeeeee00eeeeeeeeeeeeeeeeeeeee00eee0d600000006d0eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee0000000e
ee066600000eeeeeeeeee00eeeeeeeeeeeee066000eeeeeeeee000eeeee0dd0eee06666666660eeeee0000000000000e0000000e0000000e0000000e6666ddd0
e06666666660eeeeeeee066000eeeeeeeee06666660eeeeeee0666000000dd0eeee066666660eeeee0d666666666ddd06666ddd06666ddd06666ddd066660dd0
e0d60666666d0eeeeee06606660eeeeeee06606666600eeee0d0666666660d0eeeee0666660eeeee0ddd666666660dd066660dd066660dd066660dd06600000e
e0dd0666660d0eeeeee060dd060eeeeeee0ddd06660dd0eee0dd0066666000eeeeee0dddd00eeeee0dd006666660000e0600000e6600000e6600000ed00eeeee
e0dd0dddd0dd0eeeee000ddd060eeeeeeee0dd0ddd0dd0eee0dd0000660eeeeeeeee066d66d0eeeee00e0666600eeeee060eeeeedd0eeeee660eeeee66d0eeee
ee00666d6600eeeeee0dd000dd0eeeeeeeee0066d6000eeeee00d06600eeeeeeeee066006dd0eeeeeeee0dddd660eeeedd0eeeeed60eeeee00eeeeee6dd0eeee
eee06600660eeeeeee0dd6dd6660eeeeeeee0d66060eeeeeeee0dd0660eeeeeeeee066d00ddd0eeeeee0666d66d0eeee6660eeee060eeeee60eeeeee0ddd0eee
ee0dd0e0dd0eeeeeee0d000006dd0eeeeeee0dd000eeeeeeeee0d00dd0eeeeeeeeee0dd0e0000eeeee0dd6000dd0eeee06dd0eee00eeeeeed0eeeeeee0000eee
ee0dd0e0ddd0eeeeee00eeeee0ddd0eeeeeee0dd0eeeeeeeeee00e0ddd0eeeeeeeee0dd0eeeeeeeeee0dd0ee0ddd0eeee0ddd0ee0eeeeeeedd0eeeeeeeeeeeee
ee0000e00000eeeeeeeeeeeee00000eeeeeee0000eeeeeeeeeeeee00000eeeeeeeeee00eeeeeeeeeee0000ee00000eeee00000ee0eeeeeee000eeeeeeeeeeeee
1111105050000500105501111111015555511111111155551111101110111111511015dd5511015d11111111060000d0776177611d66d5000d6767766d6dd500
1111105050010500105510111110011150001000001110550000100000100000511011111111015d12222221066666d076d176d1d6776d50d676777766d6dd50
00000050500005000011100111055011555511111115555500101001001010015110015d5110015d12788821065555d076d176d1d6776d50d676777766d6dd50
55555555555555555501055000155100550001000111055501101101011011015110015d5110015d12899821060000d071d171d1d6776d50d676777766d6dd50
05000000000500005510555555011015555551111155555500000001000000015110015d5110015d12899821060000d071d171d1d6776d50d676777766d6dd50
05000000000500001110555555500111555000101110555511101111111011115101015d5110105d12888821066666d076d176d1111111101111111111111110
05001111110500111001551115551011555555111555555500101000001010001011015d51101105122222c1065555d076d176d1d6776d50d676777766d6dd50
05001011010500000101115511511000000000011100000000001001001000010000015d5110000011111111060000d06dd16dd1111111101111111111111110
55001111110555555501111551111055111155555551111101111011101111015511015d511015dd1dddd1d1dddddddd1d1dddd1d6776d502f828ff882212820
05000000000500005550111111110555001110555000100000001001001000011111015d51101111d666616166666666161666ddd6776d502f828ff882212820
55555555555555551511001111100155111555555555111100101000001010005110015d5110015d67777171777777771717776dd6776d502f828ff882212820
00000050000005001110510000055011011105555500010011101111111011115110015d5110015d67777171777777771717776dd6776d502f828ff882212820
00000050000005001000105550155101115555555555511100000001000000015110015d5110015dd666616166666666161666ddd6776d502f828ff882212820
11111050011105000555055555011100111055555550001001101101011011015110105d5101015d5dddd1d1dddddddd1d1dddd5d6776d502f828ff882212820
1111105000000500501105115550005515555555555555110010100100101001511011051011015d055551515555555515155550d6776d502f828ff882212820
1000105555555500500001555511055511000000000000010000100000100000511000000000015d000000000000000000000000d6776d502f828ff882212820
2424242424944210fff917ff666d17916666666660d1116166666666d151151dfffffff9f94294205dddddddddddd500d6776ddd111111101111111111111110
4949494949a99420fff41fff666d1f410000000060dc116177777777d155551d99999949f9424420dd6666666666dd50d6776666d6776d50d666777766d6dd50
9a9a9a9a2494421044441444666d1441dddd000060dcc16166666666d111111d44444244f9429220d667777777766d50d6777777111111101111111111111110
4949494949a9942011111111666d11111cccc11160dccc61dddddddddd1111dd22222222f9429410d677777777776d50d6677777d6776d50d676777766d6dd50
494949492494421015515555dddd17ff11cccc11600ccc61dd1111dddddddddd94999999f9429420d677666666776d50dd666666d6776d50d676777766d6dd50
2424242449a994201111111111111fff111cccc16001cc61d111111ddddddddd44244444f9229420d6776dddd6776d505dddddddd6776d50d676777766d6dd50
121212122494421055551515766d14446666666660011c61d155551d5555555522212222f4429420d6776d55d6776d5005555555dd66dd50d676777766d6dd50
0000000049a9942011111111666d11111111111160011161d151151d111111110000000099429420d6776d50d6776d50000000001dddd5000dd6d66dddddd500
7777777166d16dd17fffff91ff91666d999999913b313b31d155551dd1666d1dffffff400999900077777777d6ee566dd6776d50111111111111111111111111
7d666d616dd16dd1ffffff41ff41666d94449991bab1bab1d111151dd16dd51dff4f44209999000066666666d6e56e6d66776d501dd667777777777777766dd1
766666616dd1ddd1444444414441666d94499941bab1bab1d155551dd16dd51df44424209990000965eeee56d656ee6d77776d50101155555555555555551101
766666616dd11511111111111111666d94999441bab1bab1d151111dd16dd51df424442099000099e65ee56ed66eee6d77766d501dd667777777777777766dd1
766666616dd166d1ff917fffff91dddd99994441bab1bab1d155551dd16dd51df444422090000999ee6556eed665ee6d6666dd50101155555555555555551101
7d666d616dd16dd1ff41ffffff41111199944491bab1bab1d111151dd16dd51df44242200000999955566555d6e65e6dddddd5501dd667777777777777766dd1
76666661ddd16dd1444144444441766d994449413b313b31d155551dd1d5551d422222200009999066666666d6ee656d55555500101155555555555555551101
1111111115116dd1111111111111666d1111111111111111d151111dd111111d000000000099990011111111d6eee66d00000000111111111111111111111111
eeee0e0e00eeeeeeeeeee0e0e00eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee0000eeee1676d1eeeee00000000eeee
eee07070770e0eeeeeee07070770e0eeeeeeeeeeeeeeeeeeee8888eeeeeeeeeeaaaaaaeeeeeeeeeeeeeeeeeeeeeeeeee007700eee1676d1eeee0666777760eee
eeee0777766060eeeeeee077776606eeeeeeeeeeeeeeeeeee889988eeee88eeee7777777777e7eeeeeeeeeeeeeeeeeee077770eee1676d1eeee0556677650eee
eee0777699660eeeeeee0777699660eeeeeeeeeeeeeeeeeee89aa98eee8aa8eee7777777eeeeeeeeeeeeeeeeeeeeeeee077770eee1676d1eeee0000000000eee
eeee099999660eeeeeeee059559660eeeeeeeeeeeeeeeeeee89aa98eee8aa8eeeccccccccceeeeeee77eeeeeeeeeeeee007700eee1676d1eeee0224499420eee
eeee05f5596660eeeeeee00f079666eeeeeeeeeeeeeeeeeee889988eeee88eeecccccccccecceeeeeeee77eeeeeeeeeee0000eeee1676d1eeee0224499420eee
eeee005079960eeeeeeee00f079960eeeeeeeeeeeeeeeeeeee8888eeeeeeeeeee7777777eeeeeeeeeeeeee77eeeeeeeeeeeeeeeee1676d1e0000224499420eee
e0000ffff90000eeeeeee0ffff9000eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeaaaaaaaaaaaaaeaa7777eee77eeeeeeeeeeeeeeee1676d1e6776024499420eee
0ff70fff9066660eeeeee0f0f90660eeee0ee00eeeeeeeee0000000000000000eeaaaaaaaaaeeeeeee7777ee77eeeeeeeeeeeeee7eeeeeee5555024499420eee
e096600006666660eeee07000066660ee07007700eeeeeee02499fff99944220777777777eeeeeeeeeee777e77eeeeeeeeeeeeeee7eeeeee0000224499420eee
ee00007066660990eeee076f9060760eee0777776000eeee02499fff99944220cccccccccceeeeee777ee777777eeeeeeeeee7eeeeeeeeeeeee0224499420eee
eeee07707766000eeeeee0000760f90ee0777777066600ee02499fff99944220eaaaaaaaaaaaeeeeee777e77777eeeeeeeeeee7eee7eeeeeeee0224499420eee
eeee0777076660eeeeeee077076600ee077777760666660e02499fff999442207777777eeeeeeeeeeee777777777eeeeeee7ee77ee77eeeeeee0000000000eee
eeee0777066660eeeeee0777066660eee0777776606760400000000000000000ccccccccccecceeeeee777777777eeeeeee77e777e77eeeeeee0556677650eee
eee04422004220eeeee04422004220ee07776766600f904001d06707606d0110eccccceeeeeeeeeeeeee77777777eeeeeeee77777777eeeeeee0555555550eee
eee00000ee0000eeeee00000ee0000ee000000000000000ee00e00e00e00e00eeeeeeeeeeeeeeeeeeeee77777777eeeeeeee77777777eeeeeeee00000000eeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee0e00ee0eeeeeeeeeee00eeeeeee1111111111111111
eeee000000000eeeeeeee000000eeeeeee0e00000000e0eeeeee00000000eeeeee000000000000eeeee00707700700eeeeeee007700eeeee1661166622211111
eee00922200220eeeee00d6666d00eeee0a00cccccd1090eeee000b3bbb30eeee099fff99944420ee00777707777070eeee001d77d100eee1617871717778dd1
ee0099a22200220eee0dd677776dd0eee0a0cccccddd990eee01130b3baa30eee049ff994442220e070777777777770eeee01dd66dd10eee16171771777778d1
ee01099a22002a0ee0d6d677776d6d0ee0aaccccaaa9990ee0113330b3baa30ee049ff994442220e077777777777f770ee01ddd00ddd10ee16771717117771d1
e0110099a200290ee0d6d677776d6d0ee0aacccaaaa9990ee0113330b3baa30ee049ff994442220e0667f9777779f670ee01ddd66ddd10ee1111111111777111
e01120099900990ee0d6d677776d6d0ee0aacccaa999900ee00000000000000ee04999944222220ee06fff99779ff670e071ddd00ddd170e12dd77711d777111
e01122009900920ee000d666666d000eee0aaaa99000010ee01033000000700ee00000000000000ee09f555f9555f960e071000dd000170e12dd777117771111
e00000000088000ee0d0000000000d0eee00aa90054d110ee010330089aa780ee00000006444220e069f62044026f90ee06167000706160e12d7777777771111
ee0000000088000ee0dd00000000dd0eee070007079dd10ee010330089aa780ee007ff007442220e0669ffffffff960ee01170cff0c7110e12d7777777711181
ee0122219a00a20ee0dd67700776dd0eee00df90d79dd10ee00000000000600ee049ff994442220ee069f0f99f0f960eee01fff99fff10ee12d7771111111181
ee00121999009a0eee0d67700776d0eeee0fff99f99d10eeee0033300000000ee049ff9944422000ee009f0000f900eeee01df0000f110ee11777711111118d1
e00101449000090e000d66700766d000ee0f0000f9d100ee00000333333bb30e0049ff9944400222ee0609ffff9060eeee0019fffff100ee11777111dddd88d1
01111004000004006d00d660066d00d6e000ffff9d004400011110333333300e4049ff9940022222ee076099990670ee006d00999900d60011d11111dd888dd1
211111000000002266d00dd00dd00d660aa90000004444493311100000000bb0440000000222222200777600006777006666dd0000dd666611dd1118888dddd1
221111111111222266d0000000000d66aaaa944444444499333111111111bbbb4444222222222222770777660677707766666dddddd666661111111111111111
60676d06eeeeeeee000eeeee000eeeeeeee00eeeeee00eee11111111000000006666666670007000d0d0d0d0eeecceeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
60676d06000000004990eeee0990eeeeee0920eeee0920ee10000011dddddddd6666666660706070d0d0d0d0eec77ceeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
d0676d0d666666660aa90e0e4aa90e0eeee00eeeeee00eee10011001dddddddddddddddd60606060d0d0d0d0eec77ceeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
60676d06777707074990909009909090ee0920eeee0920ee10011001dddddddd66666666d060d060d0d0d0d0eec77ceeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
d0600d0d666606060990202049902020e090020ee090020e1001100166666666ddddddddd0d0d0d0d060d060eec77ceeeeeeeeeeeeeeeeeeeeeeecccccceeeee
d0676d0ddddddddd42220e0e02220e0e09a9922009a9922010011001ddddddddddddddddd0d0d0d060606060eec77ceeeeeeeeeeeeeeeeeeeeeecc7777cceeee
d0600d0d000000000220eeee4220eeee09a9922009a992201001100166666666ddddddddd0d0d0d060706070eec77ceeeeeeeeecceeeeeeeeeeec777777ceeee
00676d00eeeeeeee000eeeee000eeeee0404040000404040111111116666666600000000d0d0d0d070007000eec77ceeeeeeeec77ceeeeeeeeeec777777ceeee
e000000eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee000000eee0000eeee0000eeeec77ceeeeeeeec77ceeeeeeeeeec777777ceeee
00766d0000000000eeeeee77ee777eee77777eee777eee777eee77777eeeeeee00766d00e03bb30ee03bb30eeec77ceeeeeeec7777ceeeeeeeec7c7777c7ceee
071111d066666666eeeee7772e7772e7777772ee7777e2777ee77777777eeeee078888d003bbab3003bbab30eec77ceeeeecc777777cceeeeec77cccccc77cee
061712d070707777eeee7777277722777727772e77777227772777222777eeee068788d003bbab3003bbab30eec77ceeecc7777777777cceec77cc7777cc77ce
061112d060606666eee77777777722777227772e777777277722777222777eee068888d00000000000000000eec77ceec77777777777777cecccc777777cccce
0d1222d0ddddddddee76672766722767777766727667277667727667222767ee0d8888d003bbab30e00a0a0eeec77ceec77c77777777c77ceeec77cccc77ceee
00dddd0000000000e7dd7227dd727dd72227dd727dd7227ddd72277d777ddd7e00dddd0003bbab30ee0000eeeec77ceeecc7777777777cceeeeec7ceec7ceeee
e000000eeeeeeeee7777222777727777222777727777222777722227777777eee000000e00000000e056760eeeecceeeeeecccccccccceeeeeecccceecccceee
00676d00eeeeeeeee222222e222222222ee222222222e222222e222222222eeeeeeeeeee00000000ee0000eeee8aa8eeeeeeeeeeee0000eeee0000ee00eeee00
d0600d0deeeeee7777722277777222222e77777777777e2222ee7777722277777eeeeeee00000000e056760eee8aa8eeeeeeeeeee0aaaa0ee0aaaa0e06000060
d0676d0deeeee7777772e7777772eeeeee77777777777eeeeee2777777e2777777eeeeee00000000ee0000eeee8998eeeeeeeeee0aaa700e0aaa700ee07cc70e
d0600d0deeee7777777277777772eeeee7777777777777eeeee2777777722777777eeeeeeeeeeeeee056760eeee88eeeeeeeeeee0aaa7080000a7080e016610e
60676d06eee77777777777777772eeeee7777772777777eeeee27777777727777777eeeeeeeeeeee00000000eeeeeeeeeeeeeeee0aaaa80e0990a80ee016610e
d0676d0dee766667766667766672eeee776667727766677eeee276666667727666667eeeeeeeeeee03bbab30eeeeeeeeeeeeeeee0aa0988009999880e07cc70e
60676d06e7666672766676766672eeee766667727766667eeee2766666667777666667eeeeeeeeee03bbab30eeeeeeeeeeeeeeeee009990ee099990e06000060
60676d0677777772777727777772eee77777772e27777777eee27777777777777777777eeeeeeeee00000000eeeeeeeeeeeeeeeeee0000eeee0000ee00eeee00
eeeeeee7ddddd7227d7227dddd72eee7ddddd72e27ddddd7eee27dddddd777ddddddddd7eeeeeeeeee0000eeeeeeeeeee000000ee000000ee000000e00eeee00
eeeeee7dddddd72277227ddddd72ee7dddddd72e27dddddd7ee27dddddd7277ddddddddd7eeeeeeee0666d0eee0000ee0d676dd00d676dd00d676dd006000060
eeeee71111117222722271111172ee7111111777771111117ee27111111722777111111117eeeeee067006d0e006600ee000000ee000000ee000000ee071170e
eeee77777777722ee22777777772e777777777777777777777e277777777222277777777777eeeee060780d0e0676d0e0c0cc0c00cc0cc0000cc0cc0e0c66c0e
eee777777777222ee22777777772e777777772222277777777e2777777777222277777777777eeee060880d0e066dd0e0c0cc0c00cc0cc0000cc0cc0e0c66c0e
ee777777777722eeee77777777727777777772eee27777777772777777777e222227777777777eee0d600dd0e00dd00ee000000ee000000ee000000ee071170e
eee22222222222eeeee2222222222222222222eee2222222222222222222eeee222222222222eeeee0dddd0eee0000ee0d676dd00d676dd00d676dd006000060
eeee2222222222eeeee2222222222222222222eee2222222222222222222eeeee2222222222eeeeeee0000eeeeeeeeeee000000ee000000ee000000e00eeee00
__label__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d0000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000060000000000000000000000000000000000000000000000000000d0000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000006000000000000000060000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006
00000000000000000000000000000000000000d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000d0000000000000060000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000060000000000000000000000000000000000000000d0000000000000000000000000
00000000000000000000000000000000000000000000000d00000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000060000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000006000000000000000000000000000000000000000000000000000d00000000000000d00000000000d000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000600000000000000000000000d0000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000060000000000000000d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000006000000000000000000000600000000000000000000000000
0000000000000000000000000000000000000d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000600000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000d0000000600000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d00000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000060000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000600000d0000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000d0000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000060000000000000000000000000000000000000000000000000000000
00000000000000000000000000000d000000000000000000000000000000000000000000000000000000006000000000000d0000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000d00000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000007700777000777770007770007770007777700000000006000000000000000000000000000000000000
00000000000000000000000000000000000000000000077720777207777772007777027770077777777000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000777727772277772777207777722777277722277700000000000000000000000000000000000000000000
00000000000000000000000000000000000000000d07777777772277722777207777772777227772227770000000060000000000000000000000000000000000
000d0000000000000000000000000000000000000076672766722767777766727667277667727667222767000000000000000000000000000000000000000000
000000000000000000000000000000000000000007dd7227dd727dd72227dd727dd7227ddd72277d777ddd700000000000000000000000000000000000000000
00000000000000000000000000000000000000007777222777727777222777727777222777722227777777000000000000000000000000000000000000000000
00000000000000000000000000000000000000000222222022222222200222222222022222202222222220000000000000000000000000000000000000000060
00000000000000000000000000000000000000777772227777722222207777777777702222007777722277777000000000000000000000000000000000000000
00000000000000000000000000000000000007777772077777720000007777777777700000027777770277777700000000000000000000000000000000000000
00000000000000000000000000000000000077777772777777720000077777777777770000027777777227777770000000600000000000000000000000000060
00000000000000000000000000000000000777777777777777720000077777727777770000027777777727777777000000000000000000000000000000000000
00000000000000000000000000000000007666677666677666720000776667727766677000027666666772766666700000000000000000000000000000000000
00000000000000000000000000000000d76666727666767666720000766667727766667000027666666677776666670000000000000000000000000000000000
00000000000000000000000000000000777777727777277777720007777777202777777700027777777777777777777000000000000000000000000000000000
00000000000000000000000000000007ddddd7227d7227dddd720007ddddd72027ddddd700027dddddd777ddddddddd700000000000000000000000000000000
0000000000000000000000000000007dddddd72277227ddddd72007dddddd72027dddddd70027dddddd7277ddddddddd70000000000000000000000000000000
00000000000000000000000000000711111172227222711111720071111117777711111170027111111722777111111117000000000000000000000000000000
00000000000000000000000000007777777772200227777777720777777777777777777777027777777722227777777777700000000000000000000000000000
00000000000000000000000000077777777722200227777777720777777772222277777777027777777772222777777777770000000000000000000000000000
00000000000000000000000000777777777722000077777777727777777772000277777777727777777770222227777777777000000000000000000000000000
00000000000000000000000000022222222222000002222222222222222222000222222222222222222200002222222222220000000000000000000000000000
00000000000000000000000000002222222222000002222222222222222222000222222222222222222200000222222222200000000000000000000000000000
d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000d00000000000000000000000000000000000000000
00000000000000000000000000d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000
00000000000000000000000000000600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000d0000000000000000000000000000000d00000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000d0000000000000000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000600000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000060000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000d000000000000d000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000600000000d0000000000000000
00000000000000000000000006000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000600000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000600000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000d00000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000d00000000000000000000000000000000000000000000000000000000000000
000000000d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000060000000000000000000000000000000000000000000000000000000000000000000600000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000d000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000d0000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000060000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000060000000000000000000000
000d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000006000000000000000000000000000000000000000000006000000000000000000d0000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000d000000000000000000000000000000000000000000000000000000000000000000000000d000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000d00000000000000000000000000d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

__gff__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010201010101000000000000000000000101010101010101010101010101010101010101010101010101010101010100010101010101
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001010000000000000000000000000000010100000000000000000004040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
12080b070b0a0c0801070c0a0c0801070d071008010a0d0a10080b010e0610080b0b0e10100801010f06100801080f091008010b0f1010110204020d0204040d0b0f080d0b10090d0c0f080e0c10090e12080110011010080b06040c04050c05050510080107050c05080107060810080b02090609080b0c090f0a050c010a01
100801030a061008010c0a0f0a060f050c060f0610060c060f080b010e0210080b090e0c100801010f02100801090f0c1011050c0504100b0406050c0109050f050b0510060b070f050f0710060f12080101010c01080110011010080101020110080c04050407070105060f06080c0d0a0d0c0701020b0c0b080c040f041007
0105100f10110d0506050d050a0a0d05090f12080101010110080c04011004080105011004050e07020905050e0b020d0507020703090507020b030d05070e07050905070e0b050d050801100510100701020c0f0c0801060c0b0c050d070c0a0c0701050f0f10080105100f101101030d0b0204060e02010b0e120801010101
1008010501100208011003101007040504060508040604060508010b050c09080c0c050c09070302080a09080102090a09080c050a060c0801060a060c07040b0c0c0d08040c0c0c0d0703050f0f10080105100f101110100f031010070410100a0510100a071010070b10100a0c10100a0d10100f0e12080101010110080105
011003080306020802050b0a020b0208030d020f020801100410100703020a050c0801050a050c08010c0a0f0c07030d0a0f0a0801020b040c080b020c040c0801060c0b0c050d070c0a0c080b0d0c0f0c0703050f0f10080105100f101101040c090204060e02010b0e12080101010110080105011001080108020808080110
021010070509040c04050c0a040a0b08010c040c0b0705020504050705050807080705020b0b0b0705050f0f10080105100f10110f0f07030f0e02070f0f0f0a0f0e050d12080101010110080105011001080105020904080c0602080308010c021004080c0d020f03060c0a030b030801100510100705020c0f0c0801060c0b
0c050d070c0a0c0705040f0f10080104100f101101050d0b0204060e02010b0e1208010101011008010401100108011002101007070506080907070b060d09080705070d090d0a09070a09080b02080d0907080508080907080b080d09080102090d090707040e06100707090e0c100807040f0c100d0a070f0810070804100f
10080b07100810080b0d100f10110e0a07050e0a0c050e0a050d0e0a0a0d12080101010110080104011004070704020f04080704030f04070809030a05070804040f04060e09040a05080110051010080b020c0f0c0801060c0b0c050d070c0a0c080b050f0f10080105100f10110708060307080d03060e0604060e0d04070e
0605060b0805080d0905070d0a05060d0b05070e0d0501060d0b0204060e02010b0e12080101010110050f05011001051006010a03080107010a01060c0d011001080110011010060f05020703080109020c020709020a0c0b0801020b0c0b0801020c02100709060f0f10080106100f101105100c01070c0f0106100602050f
0702070f0b0207100c02070d0f02070f05030710060306100803050f09030a070b030a070504070f070407100804060f090406100a040a070705070f090507100a050a0709060a07060c0a070a0c1208010101020c080106011003070907020e03060e08020903060e0c020d03070e08030903070e0c030d0308010f04101007
0a0206020b070a0f060f0b0709070a0a0c0801070b0a0c080a080b090b0709030c060c050d0b0c0e0c0801010d01100709050f0e10080105100e1011010709090204060e02010b0e12080101010110080105011001060e08020d03080109020c04060f0a020b0506100b020b050801050c06100801080c091008010c0c0d1008
010f0c1010080c060d0610080c080d081008010a0d0b10080c0d0d0d10080c0f0d0f10080b020e04100801020f041011050f0a0105100b01070d0803080d0d03070f0a0507100b050a070a06100d0709100d0e0912080101011001060e04020b04080105020b02080110021010060c0c030f030801060406050801010c0c0c08
0b040c0b0c0801010d031008010c0d0c10080b040f0b10080104100b1011070b0802060c0902070c0a02070b0503060c0603070c070308010903050f0a0305100b03050f04040510050408010904060f0a0406100b04060f040506100505050f070505100805070f0a0507100b05070f040607100506060f0706061008060a07
0a060a070407070f0707071008070a0707080d05060e12080101010c01080110011010080101020110080b05040f04080b02070d07080b050a0f0a080b020d0d0d080105100f10110801040408010d07100b04090801040a08010d0d12080101010110080105011001060e0602070408010702070508010a021002060c0c020f
0208010a030b04080110031010080108040905070f07050a05080b020d0f10050f020e0f100801040e0d10060c060f0c0f050b080f0a0f110b0f08020b100902070b0b020c0f08030c100903060e0b03070d0604080d0b040710080507100a0501020d0c0510030e05100f0e060f020f0610030f070b050f060d070f060b0a0f
070c0c0f060f0e0f06100f0f070f021007100310060b0410080d0510070d0c10060d0d10070f0e1007100f10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000d2d3d4d5d6d70000d80000d80000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000e1e2e3e4e5e6e7e800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000102030405060000000000000000000000000000000000000000000102000000000000000000000000000000000000
00000000000000000000000000000000f0f1f2f3f4f5f6f7f8f90000000000000000000000000000000000000000000000000000000000000000000000000000000000000000090a0b00000000000000000000000000070000000000000000000000000000000000000000000003000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000d80000d800000000000000000000000000000000000000d0d1c1d000d0d1c1d000d0d1c1d00000000000000008000c00000000000000000000000000080000000000000000000000000000000000000000000004000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000c7e00000e0c7e00000e0c7e00000e0c700000000000007000d00000000000000000000000000090a00000000000000000000000000000000000000000005000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000c8c00000c0c8c00000c0c8c00000c0c800010203040506000000000000000000000000000000000b00000000000000000000000000000000000000000006000000000000000000000000000000000000
00464746767676767600000000000000000000000000000000000000000000000000000000000000000000000000000000d0d1c1d000d0d1c1d000d0d1c1d00000000000000000000000000000000000000000000000000c00000000000000000000000000000000000000000007000000000000000000000000000000000000
005657566767676767000000000000000000acad000000a0a1000000a2a300000000aaab000000a0a1000000a2a300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000008000000000000000000000000000000000000
004647464746474647000000000000000000bcbd000000b0b1000000b2b300000000babb000000b0b1000000b2b300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000009000000000000000000000000000000000000
00565756575657565700000000000000000000000000000000000000000000000000000000000000000000000000000000d0d1c1d000d0d1c1d000d0d1c1d0000001020300000000000000000000000000010203040506070800000000000000000000000000000000000000000a000000000000000000000000000000000000
004647466666666666000000000000000000000000000000000000000000000000000000000000000000000000000000c7e00000e0c7e00000e0c7e00000e0c700000004000000000000000000000000000000000000000009000000000000000000000708090a0000000000000b000000000000000000000000000000000000
005657567676767676000000000000000000000000000000000000000000000000000000000000000000000000000000c8c00000c0c8c00000c0c8c00000c0c80000000506070800000000000000000000000000000000000a000000000000000000000600000b0000000000000c000000000000000000000000000000000000
00464746767667677600000000000000000000000000000000000000000000000000000000000000000000000000000000d0d1c1d000d0d1c1d000d0d1c1d0000000000000000900000000000000000000000000000000000b000000000000000000000500000c0000000000000d0e0000000000000000000000000000000000
0056575676764b4b76000000000000000000a4a5000000a6a7000000a8a900000000a4a5000000a6a7000000a8a90000000000000000000000000000000000000000000000000a00000000000000000000000000000000000c0000000000000000000004000000000000000000000f0000000000000000000000000000000000
000000000000000000000000000000000000b4b5000000b6b7000000b8b900000000b4b5000000b6b7000000b8b90000000000000000000000000000000000000000000000000b000000000000000000000000000000000000000000000000000001020300000000000000000000100000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
010100001d251202512f2512c2513e2513d2511d0001d0001d0001d0001d0001d0001d00000201002010020100201002010020100201002010020100201002010020100201002010020100201002010020100201
0100000006470084600d4600f4501a450214402243000400004000040000400004000040000400004000040000400004000040000400004000040000400004000040000400004000040000400004000040000400
000200002e6253c62500000000002e6153c6150000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000100000161105621086310c6410f65113661186611c66121661276612c66132661366613a6613c6613e6513e6513f6513f6513f6513d6413b641366412d64123631166310f6310a62107621036210261101611
0003000036650016501065023650306503f6503e4403e4303e420246300d43005430026200c40005400156000c20000200002000b2001720007200192001620000200002001d6000020000200002000020000200
00050000352732f2732127316273114730f4730e4730d473352532f2532125316253114530f4530e4530d453352332f2332123316233114330f4330e4330d433352132f2132121316213114130f4130e4130d413
000300002e4412b24126431232112e301153010030100301003010030100301003010030100301003010030100301003010030100301003010030100301003010030100301003010030100301003010030100301
000300002265205652136522d6523b6523f252252522b64233242096323d2220f6120000200002000020000200002000020000200002000020000200002000020000200002000020000200002000020000200002
000400003023234232302323423230202342023420200202002020020200202002020020200202002020020200202002020020200202002020020200202002020020200202002020020200202002020020200202
000c00002c570255702e5002e5002e5002d5003f5013f501005010050100501005010050100501005010050100501005010050100501005010050100501005010050100501005010050100501005010050100501
00060000231502e1503e150231402e1403e140231302e1303e130231202e1203e120231102e1103e1100010000100001000010000100001000010000100001000010000100001000010000100001000010000100
00020000223601c360173601330013300213602c3603c3601a300263003c300003000030000300003000030000300003000030000300003000030000300003000030000300003000030000300003000030000300
000100000f2520a2523a2522c2523f2523f2423f2323f2223f2120020200202002020020200202002020020200202002020020200202002020020200202002020020200202002020020200202002020020200202
000a00001a77015770327703e77026700267003270032700007000070000700007000070000700007000070000700007000070000700007000070000700007000070000700007000070000700007000070000700
000700003406334063340633406334053340533405334053340433404334043340433403334033340233401334003000000000000000000000000000000000000000000000000000000000000000000000000000
000400001325307373016610c66124651366413c6413f6413f6313f6313f6313f6313f6313f6213f6213e6213e6213d6213b62139621376213662134611316112d61128611216111a611126110b6110661103610
00020000026211367110661066510964101621273733f2603f2403f2203f6033d2002b20035200392012220122201222012220122201222012220122201000010000100001000010000100001000010000100001
0008000018373233030630001305223001d3002930027300273002730227302010020100025305010000100524300010000100001000010000100001002223022230222302223022230522302223021036316665
010c00001525510205102551025517255102051025510255182551020510255102551a2551825517255182551525510205102551025517255102051025510255182551020510255102551a205182551725518255
010c000017255132051225512255192551720512255122551a2551b20512255122551c2551a255192551a25517255132051225512255192551720512255122551a2551b20512255122551c2551a255192551e255
010c00001c2451c245094551c24530645094551c2451c245094551c2451c24509455306451c245094551c2451c2451c245094551c24530645094551c2451c245094551c2451c24509455306451c245094551c245
010c00001e2451e2450b4551e245306450b4551e2451e2450b4551e2451e2450b455306451e2450b4551e2451e2451e2450b4551e245306450b4551e2451e2450b4551e2451e2450b455306451e2450b4551e245
000d00003c6253c625246052464524645102050c6550c6551860500655006550c1400c14505140051400514005145001400014000145111401114011142111321112211122111221112211112111121111211115
000d000029043290432400324043240431b1001d0431d04329100294402644028440294402910000100051002d100294402b4402d1002d4402d4402d4322d4322d4322d4222d4222d4222d4122d4122d4122d415
000d00001860518605054050c40515405114053b003186052460515435114351343518435186051860518605186051a4351c4351d4001d4301d4301d4321d4321d4321d4221d4221d4221d4121d4121d4121d415
0118000022430224252243022425224301d4302943027430274302743227422274122543025425244302442524400254002440022400224002240022402224022240222402224022240522402224022240222402
011800002443025430244302243022430224302243222432224222242222412224150040000400004000040000400004000040000400004000040000400004000040000400004000040000400004000040000400
010c0000183430d2450d2350d235316250d2450d2350d2350c3430d2450d2350d235316250d245316250d24518343082450823508235316250824508235082351834308245082350823531625082453162508245
010c00001834305245082350a235316251824516235142351834305245082350a235316251824531625142451834305245082350a235316251824516225142451834305245082350a23531625182453162514245
010f00001723016230122300f2303c6253c6051723016230122300f2300f2320f2323c6253c6253c605082021723016230122300f2303c6253c6051723016230122300d2300d2320d2323c6253c6053c6253c625
010f00000c57314455084551445514455084550c5731445514455084551445514455084551445514455084550c57314455084551445514455084550c573144551445508455144551445508455144551445508455
010e00000c0430c0431b4451b2153c6151b4451b2150f4150c0430c04327445272153c61527445272151b4150c0431b4351d2351e4353c6151d235184350c0430c0431b4351d2351e4353c6151d2351843500445
010e000005445054453f51511425111150f4250c42511115034450344511115182451b245182451d2451111501445014452024511115111152024511115202450344520245224452324522445202361d4451b245
010e00000c0430c43511115184453c6151424511245054350c0430a4253f515134253c6151342518425054350c043111151b4253f5153c6151b4253f5151b4250c0231b4351d2351e4353c6151d2351843516235
010e00000144520245224452324522435202451d44503445034050344503445182451b445182451d445111150044520245224452324522445202361d4451b245014450144511115182451b445182451d44511115
010e00000c0431b4351d2351e4353c6151d235184350c04317200131153f515134253c6151342518425014350c0331b4351d2351e4353c6151d235184351623511115111153f515134253c615134251842500445
010e0000004450044520445111151d115204451d1152911501445014452c445111151d1152c4451d11529115034452c2452e4452f2452e4452c2452944503445044452c2452e4452f2452e4452c236294451b211
011200000d5450d5450d5450b155345241c1030d5450d5450d5450d5450b1550b1350d1450115534524011550454504545045451015534524101350454504545105450a5450a5450414504145041453452401145
0112000028435262352343521230345341f4302123621435172352353517734235352f7341753534734175350154526230234301f230214301f2302143221232014351f2302143022230214302b2361c4301a230
011200000c043012350123501235186250123519725012350c0430123519725186250123501235012350c0430c043042350423504235186250623510235072350c04307235186351862513235062350423518625
011200001a4351f2351c4351c2301c5341c4301c2361c435172352353517734235352f7341753534734175351a4351f2351c4351c2301c5341c430264352b23528435282302853428430214302b2361c4301a230
011200000c04307435134350743518625134351f725074350c0430723519725186350723517235072350c0430c0430a4350a4350a435186250a4350a235094350c04309235186350a43509235074350423502435
01100000013403f5150b340306150d340251001c1013f51504340235050b3400d3403061534514345103f515063403f5150b340306150d340191101c11121202073403f5150b3400d34030615345143f5153f515
011000000c0430d525171300d525191300d20501604065140c0430d52517130191200d5350d52525614014140c0430d525171300d525191300d5253f5150d5250c0430d525171301912013214255110d5250d525
011000000c0430d525171300d2351913027230284301e2321e4301c23020430202301f4312043220222202120c0430d525171300d23525230274312723225430252302343125230254302522225412252150d525
011000000c0430d525171300d2351913027230284301e2321e4301c23020430202301f4312043220222202120c0430d525171300d435202301f4301f2222a430292312a42028230254302522225412252150d525
01100000064403f5150b340306150d340063253f5150631507440073150b3400d34030615073153f50507325084403f5150b340306150d340083351c11108335094403f5150b3400d34030615093153f51509325
010d00000c0430444504245134353f6150444513235044450c0431343513235044453f6150444513235134350c0430444504245134353f6150444513235044450c0431343513235044453f615044451323513435
010d000028545234352d2252b5452a4352b2252f54532235395203724536530374253b2403953537420342453653034225325452f2302d5252b2402a4352b520284452623623520214451f23023525284202a235
010d00002b5452a4352822523545214351f2251e5451c4352b225235452a435232252d5452b4352a2252b545284352a225285452643523225215451f4351c2251a545174351e2251a5451c4351e2251f54523225
010d00000c0430044500245104353f6150044510235004450c0430043500235104453f6150044510235104350c0430044500245104353f6150044510235004450c0431043510235004453f615004451023500445
010d00000c0430244502245124353f6150244512235024450c0431243512235024453f6150244502245124350c0430244502245124353f6150244512235024450c0430243512235024453f615124450223512435
010d00002b5452a44528245235452b5352a43528535235352b5252a02528525235252b0252a02528725237252b0252a02528725237251f7251e7251c725177251f7151e7151c715177151371512715107150b715
010c00200c0430c235004303a324004453c3253c3240c043306250c0430044000440002353e5253e5250c0530c0430f244034451b32303445370243752237025306253e5250334003440032351b3230c0431b323
010c00200c04312235064303a324064453c3253c3240c043306250c0430644006440062353e5253e5250c0430c04311244054451b323054453a0242e5223a025306253e52503345054451323605436033451b323
010c00202202524225244202432422425243252432422325223252402522420242242222524425245252422522325222242442524326224252402424522220252452524524223252442522227244262432522325
010c0000224002b4202e42030420304203042033420304203042030222294202b2202e420302202b420272202a4202a4222a42227420274202742025421274212742027420274202722027422272222742227222
010c00002a4202a4222a422274202742027422272222742527400254202a2202e4202b2202a426252202a4202742027422274222442024222244222242124421244202442024420244202422024422182210c421
001c00000c05300155001552272400124001552272422725001550015522524001550a025160252e7242e5250c05300155001552272400124001552272422725001550015522524001550a025160252e7243a525
001c00000012407145071451b7243062507145277242772507145071452752407145306250c05327724275250012407145071451b7243062507145277242772507145071452752407145306250c0532772433525
01140000224001b400194001b4001b40016400194001b400224001b400194001b4001b400164001b4002240020400204022040220402204021d4002040021400214002140021400214022140221402214023c200
01140000224001b400194001b4001b40016400194001b400224001b400194001b4001b400164001b400224002040022200204001b200204001e400232001d4001d4001d4001d4001d4021d4021d4021d4023c200
011400001e4051e4051c4001d4051c4001b4001b4021b4051e4051e4051c4001d4051c4001b4001b4021b40519400194001940019400194021940216400194001a4001a4001a4001a4001a4021a4021a4021a402
000200001a2651a2651a2651a26501205012051a2651a2651a2651a2651c2051d2051c2051b2051b2051b20519205192051920519205192051920517205162051620516205162051620516205162051620516205
__music__
03 3a3b5640
03 7a7b5640
01 1b195640
02 1c1a4040
03 1d1e4040
01 12144040
00 12144040
00 13154040
02 13154040
04 16171840
01 2f655d40
00 32655640
00 33664040
00 2f685640
00 2f314040
00 32314040
00 33304040
02 2f344040
00 6f614040
00 72684040
00 2a614040
00 2a614040
01 2a2b4040
00 2a2b4040
00 2e2b4040
00 2e2b4040
00 2a2c4040
00 2a2d4040
00 2e2c4040
02 2e2d4040
00 206b4040
00 206b4040
01 20214040
00 20214040
00 20214040
00 20214040
00 22234040
00 22234040
02 241f4040
00 60714040
00 35614040
00 36614040
01 35374040
00 36374040
00 35374040
00 36374040
00 35384040
00 36394040
00 35384040
02 36394040
01 27774040
00 27774040
00 27254040
00 27254040
00 27264040
00 27284040
00 27264040
00 27284040
00 29264040
02 29284040
00 40404040
00 40404040
00 40404040
00 40404040

