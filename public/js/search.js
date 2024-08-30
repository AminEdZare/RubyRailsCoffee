function filterByName(event) {
    const searchTerm = event.target.value.trim().toLowerCase();
    const listItems = document.querySelectorAll("ul#list li");
  
    listItems.forEach(function(item) {
      item.style.display = 'revert';
  
      if (!item.innerText.toLowerCase().includes(searchTerm)) {
        item.style.display = 'none';
      }
    })
  }