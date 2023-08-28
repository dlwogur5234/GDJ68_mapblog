let mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

let map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

let checked = true;

// let imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
let imageSrc = "../resources/img/marker2.png";    
$('.a').each((i,e)=>{
    
    // 마커 이미지의 이미지 크기 입니다
    let imageSize = new kakao.maps.Size(42, 53); 
    
    // 마커 이미지를 생성합니다    
    let markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
    lat = $(e).attr('data-lat');
    lng = $(e).attr('data-lng');
    // 마커를 생성합니다
    marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: new kakao.maps.LatLng(lat, lng), // 마커를 표시할 위치
        title : $(e).attr('data-meetingNum'), // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image : markerImage, // 마커 이미지 
        clickable : true
    });
    
    infowindow = new kakao.maps.InfoWindow({
        content: $(e).attr('data-title') // 인포윈도우에 표시할 내용
    });
    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
    kakao.maps.event.addListener(marker, 'click', makeClickListener(map, marker));
});

// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker);
    };
}

// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
function makeOutListener(infowindow) {
    return function() {
        infowindow.close();
    };
};

let overlay = "";

function makeClickListener(map, marker) {

 
    return function() {
 
        console.log(marker.Gb);
        $.ajax({
            type:"GET",
            url:"./detail?meetingNum="+marker.Gb,
            success: function(r){
                console.log(r);
                content = r;
                 overlay = new kakao.maps.CustomOverlay({
                    content: content,
                    map: map,
                    position: marker.getPosition(),
                    yAnchor: 1       
                });
                overlay.setMap(map); 
                console.log(overlay);
                console.log(marker.getPosition());
                

            }
        })
      
    
    };
}
// function closeOverlay() {
//     overlay.setMap(null);     
// }
// $("body").on("click", "#.close", function(){
    
// });
$("body").on("click","#close_overlay", function(){
    overlay.setMap(null);
})