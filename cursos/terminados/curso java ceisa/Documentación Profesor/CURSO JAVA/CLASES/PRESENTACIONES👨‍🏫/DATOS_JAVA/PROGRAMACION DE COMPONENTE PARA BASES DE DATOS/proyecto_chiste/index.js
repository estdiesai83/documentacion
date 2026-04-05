
document.addEventListener("DOMContentLoaded", function() {
     fetch("/chistetodos")
          .then(response => response.json())
          .then(data => {
               const chistesContainer = document.getElementById('chistes')
               data.forEach(chiste => {
                    const chisteElement = document.createElement('div')
                    chisteElement.classList.add('chiste')
                    chisteElement.innerText = chiste.texto
                    chistesContainer.appendChild(chisteElement)
               });
          })
          .catch(error => console.error('Error fetching chistes:', error))
})