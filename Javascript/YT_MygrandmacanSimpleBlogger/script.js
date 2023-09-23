//部落格 Blogger
let title = document.getElementById("title");
let content = document.getElementById("content");
let btn = document.getElementById("btn");
let list = document.getElementById("list");

btn.addEventListener("click", function(){
    list.innerHTML = list.innerHTML + `
    <div class="article">
                <h2>${title.value}</h2>
                <p>${content.value}</p>
            </div>
    <hr/>
    </div>
    `;
    title.value = "";
    content.value = "";
})