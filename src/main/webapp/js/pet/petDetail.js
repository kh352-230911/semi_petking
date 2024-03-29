document.InsertPetForm.addEventListener('submit', (e) => {
    const frm = e.target;
    const petName = e.target.petName.value;
    const petAge = e.target.petAge.value;
    const petGender = document.querySelector('input[name="petGender"]:checked');
    const neutered = document.querySelector('input[name="neutered"]:checked');

    // 반려동물 이름 - 1글자이상
    if (!/^[가-힣A-Za-z]{1,}$/.test(petName)) {
        alert('이름은 1글자 이상 작성해주세요.(한글 & 영대/소문자)');
        e.preventDefault();
        return false;
    }

    // 반려동물 나이 - 숫자만 입력
    if (!/^\d{1,2}$/.test(petAge)) {
        alert('숫자로 입력해주세요.(최대 두 자리)');
        e.preventDefault();
        return false;
    }

    // 반려동물 성별 선택 여부
    if (!petGender) {
        alert('반려동물 성별을 선택해주세요.');
        e.preventDefault();
        return false;
    }

    // 반려동물 중성화 여부 선택 여부
    if (!neutered) {
        alert('반려동물 중성화 여부를 선택해주세요.');
        e.preventDefault();
        return false;
    }
});