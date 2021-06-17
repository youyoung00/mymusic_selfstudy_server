// extends
// JS는 abstact - implements 없음, MixIn 없음. 
// extends의 내용: 추가(1.변수/ 2.메서드/ 3.생성자/) / 오버라이드 수정(4.변수값/ 5.메서드/) / 6.기존 포함 확장

class First{
    constructor(fCons){
        this.value = 123;
        this.fCons = fCons;
    }
    //firstPrint = _ => console.log(`value : ${this.value} / fCons : ${this.fCons}`);
    firstPrint(){
        console.log(`vlaue : ${this.value} / fCons: ${this.fCons}`);
    }
}

let fClass = new First(555);
fClass.value;
fClass.firstPrint();

class Sec extends First{
    value2 = 321;
    value = 999;
    constructor(sCons){
        super(sCons).value3 = 4444;
    }
    firstPrint(){
        console.log("SEC - FirstClass 00000");
        super.firstPrint();
    }
    secPrint = _ => console.log(this.value, this.value2, this.value3, )
}

let sClass = new Sec(666);
sClass.value;
sClass.firstPrint();
//sClass.firstPrint2();

sClass.secPrint();

    //firstPrint(){console.log("SEC - FirstClass");}
        //super.firstPrint();
        
        //firstPrint(){console.log("SEC - FirstPrint");}

// NodeJS - Express : HTTP 서버
// 코드를 다운(web-html 파일을 다운 / app - apk, apple
// 중간다리 역할(사용자와 데이터의)
// - - 실시간 수정 가능, 데이터를 독립적으로 관리할 수 있게 됨

// 정보를 관리하는 파일 생성 -- Flutter pubspec 과 같은 파일
// 터미널 $ npm init

// 패키지 호출 (import)
// var express = require("express"); 1) 패키지 호출 
// var app = express(); 2) 호출한 패키지 메서드를 변수에 담기

// HTTP 서버 열기 위해서 port 포트 지정이 필요
// IP + PORT 가 주소. -> URL(최근은 URI로도 불리움)
//  - - HTTP는 80번 / HTTPS 443번 써서 배포하도록 약속 되어있음 <특히 HTTPS 무조건 443번>

//app.listen(3000); // 3) 포트번호 지정 메서드. 

// 주문(요청 req, request) 방식
// GET : 비암호화 적용 - 주소창을 통해서 공개
// POST : 암호화가 적용 - 일반적으로는 볼 수 없음

// 3) 라우터1: 웹(html)로 요청 / 반환하는 res.send();
// HTTP
// req - [ Header(요청자의 정보 IP주소/기기정보 등) & Body(요청자가 보내는 데이터) ]
// res - [ Heder(응답자의 정보) & Body(응답하는 데이터) ]

// 요청자가 모바일이면 json 반환 / web이면 html 반환
// app.get('/check', (req,res) => {
//     var reqCheck = req.headers["user-agent"];
//     var index = reqCheck.indexOf("Chrome");
//     if(index > -1){
//         return res.send("안녕하세요, 웹? ");
//     }
//     return res.json("안녕하세요, 모바일 ??");
// });

// * nodemon -> 저장하면 재실행해주는 패키지
// sudo npm i -g nodemon 관리자 권한까지 필요한 패키지.
// nodemon mindex.js 로 자동저장되어 실행 가능해짐.

// 서버 요청의 종류
// 1. 주소(path) -- 정적 & 동적
// 2. 쿼리스트링(qs) 

// 동적으로 구성되어 있을 때 필요한 정적 라우터는 상위에 작성.
// app.get('/check/123', (req, res) => res.json("123123"))

// app.get('/check/:date', (req, res) => {
//     var date = req.params.date;

//     var id = req.query.id;
//     var pw = req.query.pw;

//     res.send(`date: ${date} / id: ${id} pw: ${pw}`);
    
// });




// let express = require("express"); // 1. 패키지 호출
// let app = express();// 2. 호출한 패키지를 변수에 담기

// app.listen(3000);// 3. 포트번호 지정 메서드
// app.get('/', (req, res) => res.send("<h1>안녕하세요</h1>"));// 4. 라우터(send: html)
// app.get('/app', (req, res) => res.json("안녕 반가워")); // 5. 라우터(json: 웹, 플러터 모두 문자열 처리)

// app.get('/check', (req, res) => { // 6. 요청자가 모바일이면 json 반환 / web이면 html 반환. (동적 구성.)
//    let reqCheck = req.headers["user-agent"];
//    let index = reqCheck.indexOf("Chrome");
//    if(index > -1 ){
//        return res.send("안녕하세요, 웹!");
//    }
//    return res.json("안녕하세요, 모바일!");
// });
// app.get('/check/123', (req,res) => res.json("123123")); // 8. 동적 구성 이후에 정적라우터 구성은 순서 중요.

// app.get('/check/:date', (req,res) => { // 7. 동적으로 구성한 라우터. params / query로 변수 담기
//     let date = req.params.date;

//     let id = req.query.id;
//     let pw = req.query.pw;

//     res.send(`date:${date} / id:${id} / pw:${pw}`); 
  
// });

let express = require("express"); // 1. 패키지 호출

let app = express(); // 2.변수에 담기

app.listen(3000); // 3.포트번호 지정 메서드

app.get('/', (req,res) => res.json([1,2,3])); // 4.라우터 (get / send)

app.get('/app', (req,res) => res.json("안녕하세요 앱")); // 5.라우터 (get / json)

app.get('/check', (req,res) => { // 6.라우터 if분기
    let reqCheck = req.headers["user-agent"];
    let index = reqCheck.indexOf("Chrome");
    if(index > -1){
        return res.send("안녕하세요, 웹!");
    }
    return res.json("안녕하세요, 앱!");
});
// 8. 정적인 분기는 순서가 중요하다.
app.get('/check/:date', (req,res) => { // 7정적 / 동적 분기, 쿼리스트링
    let date = req.params.date;
    res.send(date);
});

var datas = [
    {
      "category":"댄스",
      "categoryimg":"https://images.unsplash.com/photo-1620414573733-2e3c7668cc63?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyfHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60",
      "datas":
      [
        {
         "title":"운전만해 (We Ride)",
          "artist":"브레이브걸스(Brave Girls)",
          "jacket":"https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8Z2lybHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60",
          "lyrics":"댄스가사1"
        },
        {
          "title":"꼬리 (TAIL)",
          "artist":"선미",
          "jacket":"https://images.unsplash.com/photo-1620416264544-5866b5c5c931?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0N3x8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60",
          "lyrics":"댄스가사2"
        } 
      ]
    },
    {
      "category":"발라드",
      "categoryimg":"https://images.unsplash.com/photo-1619644918254-fa5d69bd17be?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw2OXx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60",
      "datas":
      [
        {
          "title":"살다가",
          "artist":"SG워너비",
          "jacket":"https://images.unsplash.com/photo-1526218626217-dc65a29bb444?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c2luZ2VyfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
          "lyrics":"발라드가사1"
        },
        {
          "title":"아이와 나의 바다",
          "artist":"아이유(IU)",
          "jacket":"https://images.unsplash.com/photo-1593697821252-0c9137d9fc45?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8c2luZ2VyfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
          "lyrics":"발라드가사2"
        }
      ]
    },
    {
      "category":"힙합",
      "categoryimg":"https://images.unsplash.com/photo-1548354797-6b1c0d36b3af?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjl8fGhpcCUyMGhvcHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60",
      "datas":
      [
        {
          "title":"마.피.아. In the morning",
          "artist":"ITZY (있지)",
          "jacket":"https://images.unsplash.com/photo-1612976023590-be5b6a14051d?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTh8fHNpbmdlcnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
          "lyrics":"힙합가사1"
        },
        {
          "title":"굿모닝 (Feat. 원슈타인)",
          "artist":"버벌진트(Verbal Jint),한해",
          "jacket":"https://images.unsplash.com/photo-1600395010878-e554c285589f?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzN8fGhpcCUyMGhvcHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1400&q=60",
          "lyrics":"힙합가사2"
        }
      ]    
    }
  ];

app.get('/datas/', (req,res) => {
    // xml, string, html ...
    res.json( datas );
});

app.get('/data/:id', (req,res) => {
    var id = req.params.id;
    res.json( datas[id] );
});


// /data/0/0 -> 댄스 노래 1
// /data/0/1 -> 댄스 노래 2
// 단위개발 테스트 = 라우터를 만들고 일어날 수 있는 오류를 테스트해본다.
app.get('/data/:id/:targetId', (req,res) => {
  var id = req.params.id;
  var targetId = req.params.targetId;
  res.json(datas[id].datas[targetId]);
});