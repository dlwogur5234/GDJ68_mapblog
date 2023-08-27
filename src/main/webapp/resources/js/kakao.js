const container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
const btn = document.getElementById('searchMapBtn');
const search = document.getElementById('searchMap');



// 마커를 표시할 위치와 title 객체 배열입니다 
let positions = [
    {
        title: '게시물1', 
        latlng: new kakao.maps.LatLng(33.450705, 126.570677),
        iwContent:'<div style="padding:5px;">게시물 1</div>'
    },
    {
        title: '게시물2', 
        latlng: new kakao.maps.LatLng(33.450936, 126.569477),
        iwContent:'<div style="padding:5px;">게시물 2</div>'
    },
    {
        title: '게시물3', 
        latlng: new kakao.maps.LatLng(33.450879, 126.569940),
        iwContent:'<div style="padding:5px;">게시물 3</div>'
    },
    {
        title: '게시물4',
        latlng: new kakao.maps.LatLng(33.451393, 126.570738),
        iwContent:'<div style="padding:5px;">게시물 4</div>'
    }
];

let yl =33.450705;
let xl =126.570677;
f1(yl,xl);

let check = true;

function f1(yl,xl){
    let options = { //지도를 생성할 때 필요한 기본 옵션
        center: new kakao.maps.LatLng(yl,xl), //지도의 중심좌표.
        level: 3 //지도의 레벨(확대, 축소 정도)
    };

    let map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
    // let markerPosition = new kakao.maps.LatLng(yl,xl);
    var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

    for (let i = 0; i < positions.length; i++) {
        
        // 마커 이미지의 이미지 크기 입니다
        let imageSize = new kakao.maps.Size(24, 35); 
        
        // 마커 이미지를 생성합니다    
        let markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
        
        // 마커를 생성합니다
            marker = new kakao.maps.Marker({
            map: map, // 마커를 표시할 지도
            position: positions[i].latlng, // 마커를 표시할 위치
            title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
            clickable : true,
            image : markerImage // 마커 이미지 
        });

            infowindow = new kakao.maps.InfoWindow({
            content : positions[i].iwContent,
            removable : true
        });
        kakao.maps.event.addListener(marker, 'click', makeClickListener(map, marker, infowindow));
    }


        function makeClickListener(map, marker, infowindow) {
            return function() {
                if(check){
                    infowindow.open(map, marker);
                    check = !check;
                }else {
                    infowindow.close(map,marker);
                    check = !check;
                }
            };
        }
    
    // let marker = new kakao.maps.Marker({
    //     position: markerPosition
    // })
    marker.setMap(map);
};
const address = document.getElementById('address');

let query="전북 삼성동 100";
btn.addEventListener('click',function(){
    query= search.value;
    address.innerHTML=""
    map(query);
})
map(query);
function map(query){
    url = 'https://dapi.kakao.com/v2/local/search/address.json?query='+query;
        fetch(url, {
            method:"GET", 
            headers : {
            "Content-type" : "application/json;charset=UTF-8",
            "Authorization" : "KakaoAK ${40beb712ef49b2baf56fe3191ca324dc}"
        }
        })
        .then((response)=>{return response.json()}) 
        .then((r)=>{
            for(i of r.documents){
                let p = document.createElement('p');
                let dx = document.createAttribute('data-x');
                dx.value=i.x;
                p.setAttributeNode(dx);
                
                let dy = document.createAttribute('data-y');
                dy.value=i.y;
                p.setAttributeNode(dy);
                
                p.innerText=i.address_name;

                let a = document.createAttribute('class');
                a.value="c1"
                p.setAttributeNode(a);
                address.appendChild(p);
            }
            
        });
    }





address.addEventListener('click',function(event){
    if(event.target.classList.contains("c1")){
        let x = event.target.getAttribute('data-x');
        let y = event.target.getAttribute('data-y');
        xl = x;
        yl = y;
        
        f1(yl,xl);
    }
})

