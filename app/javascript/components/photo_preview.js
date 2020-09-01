const previewImageOnFileSelect = () => {
  // we select the photo input
  const input = document.getElementById('photo-input');
  if (input) {
    // we add a listener to know when a new picture is uploaded
    input.addEventListener('change', () => {
      // we call the displayPreview function (who retrieve the image url and display it)
      displayPreview(input);

      // si l'input a au moins photo => je hide le boutton
    })
  }
}

const displayPreview = (input) => {
  if (input.files && input.files[0]) {
    const file = input.files[0];

    // const reader = new FileReader();
    // reader.onload = (event) => {
    //   document.getElementById('photo-preview').src = event.currentTarget.result;
    // }
    // reader.readAsDataURL(input.files[0])
    // document.getElementById('photo-preview').classList.remove('hidden');
    const photoPreview = document.getElementById("photo-preview")
    let fileType = file.type.split("/");
    if (fileType[1] === "pdf") {
      photoPreview.innerHTML = `<div style='position: relative;'><embed class='img-preview' src=${URL.createObjectURL(file)} class="animate__animated animate__slideInLeft"><div class='delete-img-btn'>X</div></div>`
    } else {
      photoPreview.innerHTML = `<div style='position: relative;'><img class='img-preview' src=${URL.createObjectURL(file)} class="animate__animated animate__slideInLeft"><div class='delete-img-btn'>X</div></div>`
    }
  }
}

const initDrop = () => {
  const dropArea = document.querySelector(".droparea")
  if (dropArea) {
    ['dragenter', 'dragover', 'dragleave', 'drop'].forEach(eventName => {
      dropArea.addEventListener(eventName, (e) => {
        e.preventDefault();
        e.stopPropagation();
      })
    })
    dropArea.addEventListener('drop', (e) => {
      dropArea.classList.remove('active')
      document.getElementById('manual-input').classList.add('d-none');
      const input = document.querySelector('#photo-input');
      // let existingFiles = input.files;
      const dt = e.dataTransfer;
      const newFiles = dt.files
      input.files = newFiles;
      let event = new Event('change')
      input.dispatchEvent(event);
    });
    dropArea.addEventListener('dragenter', (e) => {
      dropArea.classList.add('active')
      // addd class active to droparea
      console.log('im in')
    });
    dropArea.addEventListener('dragover', (e) => {
      console.log('im hovering')
      dropArea.classList.add('active')
    });
    dropArea.addEventListener('dragleave', (e) => {
      // rempve class active to droparea
      dropArea.classList.remove('active')
    });
  };
  // event listener 'click' sur le delete img btn
  // imput.value = ''
  // dispatch event change sur l'input
  // affiche le bouton manuel

  const deletion = document.querySelector(".delete-img-btn")
  if (deletion) {
    deletion.addEventListener('click', (e) => {
      console.log("hey")
      input.value = ""
      input.dispatchEvent(event);
    });
  }
}




export { previewImageOnFileSelect, initDrop };
