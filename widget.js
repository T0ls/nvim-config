// Imposta il nome della tua repository
const repositoryName = "nvim-config";

// Funzione per ottenere le informazioni sulla repository
function getRepositoryInfo() {
  fetch(`https://api.github.com/repos/T0ls/${repositoryName}`)
    .then(response => response.json())
    .then(data => {
      // Visualizza le informazioni sulla console (puoi personalizzare come desideri)
      console.log("Repository name:", data.full_name);
      console.log("Stars:", data.stargazers_count);
      console.log("Forks:", data.forks_count);

      // Aggiorna il contenuto HTML con le informazioni della repository
      document.getElementById("repositoryName").innerText = data.full_name;
      document.getElementById("starsCount").innerText = data.stargazers_count;
      document.getElementById("forksCount").innerText = data.forks_count;
    })
    .catch(error => console.error("Error fetching repository info:", error));
}

// Chiama la funzione per ottenere le informazioni sulla repository al caricamento della pagina
window.onload = getRepositoryInfo;
