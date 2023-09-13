// let now_utc = Date.now();

// let timeOff = new Date().getTimezoneOffset()*60000;

// let today = new Date(now_utc-timeOff).toISOString().substring(0,16);
// console.log(today);

// $("#meetingDate").attr("min",today);


// 지도
$(document).ready(function(){
  console.log("map start")
  let lat = $('#lat').val();
  let lng = $('#lng').val();

  console.log(lat);
  console.log(lng);

  getKakaoMap3(lat,lng);
})


let centertLat =33.450701;
let centerLng =126.570667;



function getKakaoMap(centertLat,centerLng){

  let mapContainer = document.getElementById('map'), // 지도를 표시할 div 
      mapOption = { 
          center: new kakao.maps.LatLng(centertLat,centerLng), // 지도의 중심좌표
          level: 3 // 지도의 확대 레벨
      };

  let map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

  // 주소-좌표 변환 객체를 생성합니다
  let geocoder = new kakao.maps.services.Geocoder();

  // 주소로 좌표를 검색합니다
  geocoder.addressSearch($('#adrs').val(), function(result, status) {

    // 정상적으로 검색이 완료됐으면 
    if (status === kakao.maps.services.Status.OK) {

      let coords = new kakao.maps.LatLng(result[0].y, result[0].x);
     
      // 결과값으로 받은 위치를 마커로 표시합니다
      let marker = new kakao.maps.Marker({
          map: map,
          position: coords
      });
      $("#lat").val(coords.Ma);
      $("#lng").val(coords.La);
      map.setCenter(coords);
      kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
      
        // 클릭한 위도, 경도 정보를 가져옵니다 
        let latlng = mouseEvent.latLng; 
        
        // 마커 위치를 클릭한 위치로 옮깁니다
        marker.setPosition(latlng);
        
        let message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
        message += '경도는 ' + latlng.getLng() + ' 입니다';
        
        let resultDiv = document.getElementById('clickLatlng'); 
        resultDiv.innerHTML = message;
        
        $("#lat").val(latlng.getLat());
        $("#lng").val(latlng.getLng());
  
      });
    }else{
      alert('검색 실패');
    // 지도를 클릭한 위치에 표출할 마커입니다
    let marker = new kakao.maps.Marker({ 
        // 지도 중심좌표에 마커를 생성합니다 
        position: map.getCenter() 
    }); 
    // 지도에 마커를 표시합니다
    marker.setMap(map);
    
    // 지도에 클릭 이벤트를 등록합니다
    // 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
    kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
      
      // 클릭한 위도, 경도 정보를 가져옵니다 
      let latlng = mouseEvent.latLng; 
      
      // 마커 위치를 클릭한 위치로 옮깁니다
      marker.setPosition(latlng);
      
      let message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
      message += '경도는 ' + latlng.getLng() + ' 입니다';
      
      let resultDiv = document.getElementById('clickLatlng'); 
      resultDiv.innerHTML = message;
      
      $("#lat").val(latlng.getLat());
      $("#lng").val(latlng.getLng());

    });
   }
  })

}


// 업데이트 시에 가져올 지도
function getKakaoMap3(lat,lng){

  let mapContainer = document.getElementById('map'), // 지도를 표시할 div 
      mapOption = { 
          center: new kakao.maps.LatLng(lat,lng), // 지도의 중심좌표
          level: 3 // 지도의 확대 레벨
      };

  let map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

    let marker = new kakao.maps.Marker({ 
        // 지도 중심좌표에 마커를 생성합니다
        // position: map.getCenter() 
        position: new kakao.maps.LatLng(lat,lng)
    }); 
    // 지도에 마커를 표시합니다
    marker.setMap(map);
    
    // 지도에 클릭 이벤트를 등록합니다
    // 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
    kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
      
      // 클릭한 위도, 경도 정보를 가져옵니다 
      let latlng = mouseEvent.latLng; 
      
      // 마커 위치를 클릭한 위치로 옮깁니다
      marker.setPosition(latlng);
      
      // let message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
      // message += '경도는 ' + latlng.getLng() + ' 입니다';
      
      // let resultDiv = document.getElementById('clickLatlng'); 
      // resultDiv.innerHTML = message;
      
      $("#lat").val(latlng.getLat());
      $("#lng").val(latlng.getLng());

    });
   }

