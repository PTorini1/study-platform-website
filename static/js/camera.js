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
        
        let teste = document.getElementById("fotoPerfil")
        let urlImagem = teste.name
        urlImagem.name = canvas.toDataURL();

        canvas.toBlob((blob) => {
            var newImg = document.getElementById('imgPerfil');
            var url = URL.createObjectURL(blob);
          
            newImg.onload = () => {
              URL.revokeObjectURL(url);
            };
          
            newImg.src = url;
            console.log(url);

            teste.value = url;
            teste.id = url;
            teste.value = url;
            console.log(teste.name)
            
          });

          $.post('localhost:5000\\perfilProfessor', {url:url}, function(response){ 
                
          });

    });
  
 }
 
 