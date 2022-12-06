function startVideoFromCamera(){
    const specs = {video:{width:300,height:300}};
    const videoElement = document.getElementById('video');
    const canvas = document.getElementById('canvas');
    const context = canvas.getContext('2d');
   
    navigator.mediaDevices.getUserMedia(specs).then(stream=>{
        videoElement.srcObject = stream;
        videoElement.play();
    }).catch(error =>{
        console.log(error)
    });
   
    document.getElementById('tiraFoto').addEventListener('click',() =>{
        videoElement.pause();
        videoElement.classList.add('none')
  
        canvas.width = videoElement.videoWidth
        canvas.height = videoElement.videoHeight
        context.drawImage(videoElement, 0 , 0)
  
        const imagem = document.getElementById('url_foto')
        imagem.name = 'Perfil.png'
  
        alert(download.href)
    });
  
 }
 
 