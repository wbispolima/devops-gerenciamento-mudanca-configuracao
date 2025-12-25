// Navegação entre páginas
function showPage(pageId) {
  // Ocultar todas as páginas
  const pages = document.querySelectorAll('.page');
  pages.forEach(page => page.classList.remove('active'));
  
  // Mostrar página selecionada
  const selectedPage = document.getElementById(pageId);
  if (selectedPage) {
    selectedPage.classList.add('active');
  }
  
  // Scroll para o topo
  window.scrollTo(0, 0);
}

// Inicializar
document.addEventListener('DOMContentLoaded', function() {
  // Mostrar página inicial por padrão
  showPage('home');
  
  // Adicionar event listeners aos links de navegação
  const navLinks = document.querySelectorAll('nav a, .nav-link');
  navLinks.forEach(link => {
    link.addEventListener('click', function(e) {
      e.preventDefault();
      const pageId = this.getAttribute('data-page');
      if (pageId) {
        showPage(pageId);
      }
    });
  });
  
  // Menu mobile
  const menuButton = document.querySelector('.menu-button');
  const nav = document.querySelector('nav');
  if (menuButton) {
    menuButton.addEventListener('click', function() {
      nav.style.display = nav.style.display === 'flex' ? 'none' : 'flex';
    });
  }
});
