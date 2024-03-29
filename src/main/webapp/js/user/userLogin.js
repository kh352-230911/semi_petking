// 페이지 로드시 저장된아이디 불러오기
const saveId = localStorage.getItem('saveId');
if(saveId) {
    document.querySelector("#id").value = saveId;
    document.querySelector("#saveId").checked = true;
}

// 로그인폼 제출시 아이디저장
document.userLoginFrm.addEventListener('submit', (e) => {
    console.log('submit');
    const saveId = e.target.saveId;
    const id = e.target.id;
    if(saveId.checked) {
        localStorage.setItem('saveId', id.value);
    }
    else {
        localStorage.removeItem('saveId');
    }
});