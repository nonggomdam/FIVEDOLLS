/**
 * 주소 검색 공통 함수
 * daum map api 사용
 * @param {string} zipcodeId - 우편번호 입력 필드의 ID
 * @param {string} addressId - 기본 주소 입력 필드의 ID
 * @param {string} detailAddressId - 상세 주소 입력 필드의 ID
 */
function searchAddress(zipcodeId, addressId, detailAddressId) {
    new daum.Postcode({
        oncomplete: function(data) {
            let address1 = "";

            // 도로명 주소인 경우
            if (data.userSelectedType === 'R') {
                address1 = data.roadAddress + " (" + data.bname + data.buildingName + ")";
            } else { // 지번 주소인 경우
                address1 = data.jibunAddress;
            }

            // 입력란에 우편번호, 주소1 출력
            document.getElementById(zipcodeId).value = data.zonecode;
            document.getElementById(addressId).value = address1;

            // 상세 주소 입력란 초기화 후 포커스
            let address2 = document.getElementById(detailAddressId);
            address2.value = "";
            address2.focus();
        }
    }).open();
}