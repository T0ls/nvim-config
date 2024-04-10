document.addEventListener("DOMContentLoaded", function() {
    var container = document.createElement("div");
    container.innerHTML = `
        <h3>Directory Structure</h3>
        <ul id="directory-list"></ul>
    `;
    document.body.appendChild(container);

    var directoryList = document.getElementById("directory-list");

    fetch("https://api.github.com/repos/T0ls/nvim-config/contents")
    .then(response => response.json())
    .then(data => {
        data.forEach(item => {
            if (item.type === "dir") {
                var listItem = document.createElement("li");
                var link = document.createElement("a");
                link.textContent = item.name;
                link.href = item.html_url;
                link.target = "_blank";
                listItem.appendChild(link);
                directoryList.appendChild(listItem);
            }
        });
    })
    .catch(error => {
        console.error("Error fetching directory structure:", error);
    });
});
