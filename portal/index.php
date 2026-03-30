<?php
session_start();
require_once('db/config.php');
require_once('const/school.php');
?>
<!DOCTYPE html>
<html>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="icon" href="images/icon.ico">
<link rel="stylesheet" type="text/css" href="cdn.jsdelivr.net/npm/bootstrap-icons%401.10.5/font/bootstrap-icons.css">
<link type="text/css" rel="stylesheet" href="loader/waitMe.css">
<title>ELIMU SCHOOL PORTAL - Login</title>
</head>
<body>






<style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

body {background-image: url('images/back.jpg');
       background-size: cover;
       background-position: center;
       background-repeat: no-repeat !important;"

}

   

    /* Navbar styles */
    .navbar {
      background-color: #8a1e56;
      padding: 1rem 5%;
      display: flex;
      justify-content: space-between;
      align-items: center;
      box-shadow: 0 8px 20px rgba(0, 0, 0, 0.08);
      position: sticky;
      top: 0;
      z-index: 1000;
      flex-wrap: wrap;
      gap: 1rem;
    }

    .logo {
      display: flex;
      align-items: baseline;
      gap: 6px;
      color: white;
      text-decoration: none;
      font-size: 1.8rem;
      font-weight: 800;
      letter-spacing: -0.5px;
      transition: opacity 0.2s;
    }
    .logo span {
      color: #93c5fd;
      font-weight: 600;
    }
    .logo:hover {
      opacity: 0.9;
    }

    .nav-links {
      display: flex;
      list-style: none;
      gap: 2rem;
      flex-wrap: wrap;
    }

    .nav-links li a {
      color: #f1f5f9;
      text-decoration: none;
      font-size: 1.05rem;
      font-weight: 500;
      padding: 0.5rem 0;
      transition: all 0.2s ease;
      position: relative;
      display: inline-block;
      cursor: pointer;
    }

    .nav-links li a:hover {
      color: #bfdbfe;
    }

    .user-info {
      display: flex;
      align-items: center;
      gap: 12px;
      background: rgba(255,255,255,0.1);
      padding: 0.4rem 1rem 0.4rem 0.8rem;
      border-radius: 40px;
      backdrop-filter: blur(2px);
    }
    .user-info span {
      color: white;
      font-weight: 500;
      font-size: 0.9rem;
    }
    .avatar {
      width: 38px;
      height: 38px;
      background: #facc15;
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      font-weight: bold;
      color: #1e3a8a;
      font-size: 1rem;
      box-shadow: 0 2px 6px rgba(0,0,0,0.2);
    }

    /* MAIN CONTAINER - holds the static background/hero content */
    .main-container {
      flex: 1;
      padding: 2rem 5%;
      transition: all 0.2s;
    }

    /* Static hero content - visible when no popup, gives context */
    .hero-static {
      max-width: 1000px;
      margin: 0 auto;
      text-align: center;
      padding: 3rem 1rem;
    }
    .hero-static h1 {
      font-size: 3rem;
      color: #0f172a;
      margin-bottom: 1rem;
    }
    .hero-static p {
      font-size: 1.2rem;
      color: #334155;
      margin-bottom: 2rem;
    }
    .hero-badge {
      background: #eef2ff;
      display: inline-block;
      padding: 0.5rem 1.5rem;
      border-radius: 40px;
      color: #1e3a8a;
      font-weight: 500;
    }

    /* FLOATING MODAL / POPUP STYLES */
    .modal-overlay {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background-color: rgba(23, 131, 161, 0.5);
 backdrop-filter: blur(4px);
      z-index: 2000;
      display: flex;
      align-items: center;
      justify-content: center;
      opacity: 0;
      visibility: hidden;
      transition: opacity 0.25s ease, visibility 0.25s ease;
    }

    .modal-overlay.active {
      opacity: 1;
      visibility: visible;
    }

    .modal-popup {
      background: pink;
      width: 90%;
      max-width: 750px;
      max-height: 85vh;
      border-radius: 32px;
      box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.35);
      overflow-y: auto;
      transform: scale(0.96);
      transition: transform 0.2s cubic-bezier(0.2, 0.9, 0.4, 1.1);
      animation: modalPopIn 0.3s ease-out;
    }

    .modal-overlay.active .modal-popup {
      transform: scale(1);
    }

    @keyframes modalPopIn {
      0% {
        opacity: 0;
        transform: scale(0.92);
      }
      100% {
        opacity: 1;
        transform: scale(1);
      }
    }

    .modal-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 1.2rem 1.8rem;
      border-bottom: 1px solid #e2e8f0;
      background: #ffffff;
      border-radius: 32px 32px 0 0;
      position: sticky;
      top: 0;
      background: white;
      z-index: 10;
    }
    .modal-header h2 {
      font-size: 1.5rem;
      font-weight: 700;
      color: #0f172a;
      display: flex;
      align-items: center;
      gap: 10px;
    }
    .close-modal {
      background: #f1f5f9;
      border: none;
      font-size: 1.8rem;
      cursor: pointer;
      width: 38px;
      height: 38px;
      border-radius: 40px;
      display: flex;
      align-items: center;
      justify-content: center;
      transition: all 0.2s;
      color: #475569;
      font-weight: bold;
    }
    .close-modal:hover {
      background: #e2e8f0;
      transform: scale(1.05);
      color: #0f172a;
    }
    .modal-body {
      padding: 1.8rem;
    }

    /* content inside popup (reuse existing elegant styles) */
    .about-content-compact h3 {
      color: #1e3a8a;
      margin: 1rem 0 0.5rem;
    }
    .about-content-compact p {
      line-height: 1.5;
      color: #1f57a5;
      margin-bottom: 0.8rem;
    }
    .value-chips {
      display: flex;
      flex-wrap: wrap;
      gap: 0.6rem;
      margin: 1rem 0;
    }
    .chip {
      background: #eef2ff;
      padding: 0.3rem 1rem;
      border-radius: 40px;
      font-size: 0.8rem;
      font-weight: 500;
      color: #1e3a8a;
    }
    .stat-mini {
      display: flex;
      gap: 1rem;
      flex-wrap: wrap;
      margin: 1rem 0;
    }
    .stat-mini div {
      background: #f8fafc;
      padding: 0.5rem 1rem;
      border-radius: 20px;
      flex: 1;
      text-align: center;
      font-weight: 600;
    }

    .page-placeholder-popup {
      text-align: center;
      padding: 0.5rem;
    }
    .mock-icon-lg {
      font-size: 3rem;
      margin-bottom: 0.5rem;
    }

    footer {
      text-align: center;
      padding: 1.5rem;
      color: #475569;
      font-size: 0.8rem;
      border-top: 1px solid #e2e8f0;
      background: #ffffffcc;
      margin-top: 2rem;
    }

    /* responsive popup */
    @media (max-width: 640px) {
      .modal-popup {
        width: 95%;
        max-height: 90vh;
      }
      .modal-header h2 {
        font-size: 1.2rem;
      }
      .hero-static h1 {
        font-size: 2rem;
      }
    }
  </style>
</head>
<body>

  <!-- Navigation bar: clicking any link will open floating popup with content, staying on same page -->
  <nav class="navbar">
    <a href="#" class="logo" id="logo-home">
      <strong>ELIMU</strong><span>School</span>
    </a>

    <ul class="nav-links">
      <li><a href="#" data-page="dashboard">Dashboard</a></li>
      <li><a href="#" data-page="students">Students</a></li>
      <li><a href="#" data-page="teachers">Teachers</a></li>
      <li><a href="#" data-page="classes">Classes</a></li>
      <li><a href="#" data-page="grades">Grades</a></li>
      <li><a href="#" data-page="about" id="about-nav-link">About</a></li>
    </ul>

    <div class="user-info">
      <span>ELIMU SCHOOL MANAGEMT SYSTEM</span>
      <center>
    <img 
        height="50" 
        src="images/logo/<?php echo WBLogo; ?>" 
        style="border-radius: 50%; object-fit: cover;"
        alt="Logo">
</center>
    </div>
  </nav>

  <!-- Main area: shows static landing/hero content (background), never replaced, popup appears on top -->
 

  <!-- FLOATING MODAL POPUP (hidden by default) -->
  <div id="popupModal" class="modal-overlay">
    <div class="modal-popup">
      <div class="modal-header">
        <h2 id="modalTitle">📄 Information</h2>
        <button class="close-modal" id="closeModalBtn">&times;</button>
      </div>
      <div class="modal-body" id="modalBody">
        <!-- dynamic popup content injected here -->
      </div>
    </div>
  </div>

 

  <script>
    // ---- Generate different popup content based on page type (all floating) ----
    function getPopupContent(pageId, titleMap) {
      if (pageId === 'about') {
        // RICH ABOUT US content displayed inside modal popup
        return `
          <div class="about-content-compact">
            <h3>📖 About Elimu School</h3>
            <p><strong>Elimu School</strong> is a premier learning institution dedicated to shaping future leaders through academic excellence, character development, and innovation. The word <em>"Elimu"</em> means education in Swahili, reflecting our commitment to knowledge that transforms communities.</p>
            <p>Located in the heart of the city, we offer a nurturing environment where students from diverse backgrounds thrive. Our holistic approach blends modern technology with timeless values, ensuring every learner reaches their full potential.</p>
            
            <h3>🎯 Our Mission</h3>
            <p>To empower learners with knowledge, critical thinking, and integrity, preparing them to excel in a rapidly evolving global society.</p>
            
            <h3>✨ Our Vision</h3>
            <p>To be a center of educational excellence that inspires innovation, empathy, and lifelong learning for every student.</p>
            
            <h3>🌟 Core Values</h3>
            <div class="value-chips">
              <span class="chip">📚 Excellence</span>
              <span class="chip">🤝 Integrity</span>
              <span class="chip">💡 Innovation</span>
              <span class="chip">🌍 Community</span>
              <span class="chip">💪 Resilience</span>
              <span class="chip">🌈 Inclusivity</span>
            </div>
            
            <div class="stat-mini">
              <div>📊 1,200+ Students</div>
              <div>👩‍🏫 85+ Teachers</div>
              <div>🏆 98% Satisfaction</div>
            </div>
            <p style="font-size: 0.85rem; border-top: 1px solid
             #e2e8f0; padding-top: 1rem; margin-top: 1rem;">
             📍 Nairobi, Kenya | 📞 +254 759 838 070 | ✉️ infotech@elimu.school</p>
          </div>
        `;
      } 
      else if (pageId === 'dashboard') {
        return `
          <div class="page-placeholder-popup">
            <div class="mock-icon-lg">📊</div>
            <h3 style="color:#1e3a8a; margin-bottom: 0.5rem;">Dashboard Overview</h3>
            <p>Welcome to the Elimu School Management Dashboard. Key metrics and real-time stats.</p>
            <div style="background: #eef2ff; border-radius: 20px; padding: 1rem; margin-top: 1rem;">
              <p>📈 Weekly attendance: <strong>96%</strong></p>
              <p>🧑‍🎓 Top performing class: <strong>Grade 8</strong></p>
              <p>🏅 Average grade: <strong>B+</strong></p>
            </div>
          </div>
        `;
      } 
      else if (pageId === 'students') {
        return `
          <div class="page-placeholder-popup">
            <div class="mock-icon-lg">👩‍🎓</div>
            <h3 style="color:#1e3a8a;">Students Directory</h3>
            <p>Manage student profiles, enrollment records, and academic history. Current stats:</p>
            <div style="display: flex; gap: 0.8rem; flex-wrap: wrap; justify-content: center; margin: 1rem 0;">
              <span class="chip">📌 1,280 Enrolled</span>
              <span class="chip">🎓 112 Graduates '25</span>
              <span class="chip">🏅 34 Honors</span>
            </div>
            <p><em>Quick demo — student management tools available in full version.</em></p>
          </div>
        `;
      } 
      else if (pageId === 'teachers') {
        return `
          <div class="page-placeholder-popup">
            <div class="mock-icon-lg">👩‍🏫</div>
            <h3 style="color:#1e3a8a;">Our Teachers</h3>
            <p>Dedicated educators who inspire excellence. Faculty breakdown:</p>
            <div class="value-chips" style="justify-content:center;">
              <span class="chip">🧪 STEM: 28</span>
              <span class="chip">📖 Languages: 22</span>
              <span class="chip">🎨 Arts: 12</span>
              <span class="chip">🏃 Physical Ed: 6</span>
            </div>
            <p>⭐ 85+ certified teachers &nbsp;|&nbsp; 🏆 15+ years average experience</p>
          </div>
        `;
      }
      else if (pageId === 'classes') {
        return `
          <div class="page-placeholder-popup">
            <div class="mock-icon-lg">🏫</div>
            <h3 style="color:#1e3a8a;">Classes & Streams</h3>
            <p>Browse all class groups from Kindergarten to Grade 12.</p>
            <div class="value-chips" style="justify-content:center;">
              <span class="chip">📖 KG - Grade 5</span>
              <span class="chip">📐 Grade 6-8 (Middle)</span>
              <span class="chip">⚛️ High School (9-12)</span>
            </div>
            <p>➕ 42 total class sections &nbsp;|&nbsp; 🧑‍🏫 Student-teacher ratio 18:1</p>
          </div>
        `;
      }
      else if (pageId === 'grades') {
        return `
          <div class="page-placeholder-popup">
            <div class="mock-icon-lg">📝</div>
            <h3 style="color:#1e3a8a;">Grades & Reports</h3>
            <p>Track academic performance, term results, and transcripts.</p>
            <div style="background:#f8fafc; border-radius: 20px; padding: 0.8rem; margin-top: 0.8rem;">
              🏆 <strong>Average GPA:</strong> 3.7 &nbsp;|&nbsp; 📊 Exam improvement: +12%<br>
              📅 Term 2 results published: <strong>June 2025</strong>
            </div>
          </div>
        `;
      }
      else {
        return `<p>Information not available. Please try again.</p>`;
      }
    }

    // Get title for each modal header
    function getModalTitle(pageId) {
      const titles = {
        about: '📖 About Elimu School',
        dashboard: '📊 Dashboard',
        students: '👩‍🎓 Students Overview',
        teachers: '👩‍🏫 Teaching Staff',
        classes: '🏫 Classes & Streams',
        grades: '📝 Grades & Academic Reports'
      };
      return titles[pageId] || '📄 Information';
    }

    // DOM elements
    const modalOverlay = document.getElementById('popupModal');
    const modalBodyDiv = document.getElementById('modalBody');
    const modalTitleSpan = document.getElementById('modalTitle');
    const closeModalBtn = document.getElementById('closeModalBtn');

    // Function to open popup with specific page content
    function openPopup(pageId) {
      // Generate content and title
      const title = getModalTitle(pageId);
      const contentHtml = getPopupContent(pageId);
      
      modalTitleSpan.innerHTML = title;
      modalBodyDiv.innerHTML = contentHtml;
      
      // Show modal with active class
      modalOverlay.classList.add('active');
      // Prevent body scroll when modal open (nice UX)
      document.body.style.overflow = 'hidden';
    }

    // Close modal function
    function closePopup() {
      modalOverlay.classList.remove('active');
      document.body.style.overflow = '';
    }

    // Close on overlay click (background)
    modalOverlay.addEventListener('click', (e) => {
      if (e.target === modalOverlay) {
        closePopup();
      }
    });

    // Close button event
    closeModalBtn.addEventListener('click', closePopup);

    // Close with Escape key
    document.addEventListener('keydown', (e) => {
      if (e.key === 'Escape' && modalOverlay.classList.contains('active')) {
        closePopup();
      }
    });

    // ---- Attach click handlers to ALL navigation links: they open popup instead of replacing main area ----
    function initPopupNavigation() {
      const navLinks = document.querySelectorAll('.nav-links li a');
      navLinks.forEach(link => {
        link.addEventListener('click', (e) => {
          e.preventDefault();
          const page = link.getAttribute('data-page');
          if (page) {
            openPopup(page);
          } else {
            // fallback for any link without data-page (but all have)
            openPopup('about');
          }
        });
      });

      // Logo click opens Dashboard popup (or custom) - optional, but remains popup style
      const logo = document.getElementById('logo-home');
      if (logo) {
        logo.addEventListener('click', (e) => {
          e.preventDefault();
          openPopup('dashboard');
        });
      }

      // For "About" link specifically, also ensure any other anchor consistency
      // Also handle potential future dynamic addition but static is fine.
    }

    // Optional: remove any active class styling since we don't need active page highlight
    // but we can keep visual but not necessary. We'll remove active class logic from previous,
    // but we can keep UI simple — no active indicator needed because popup modal appears.
    // However we'll clean any leftover active style by removing .active class from all links if needed.
    function removeActiveStates() {
      const navItems = document.querySelectorAll('.nav-links li a');
      navItems.forEach(link => {
        link.classList.remove('active');
      });
    }

    // On initial load, no active link needed, but we could set nothing.
    document.addEventListener('DOMContentLoaded', () => {
      removeActiveStates();   // ensure no active underline because we use popups
      initPopupNavigation();
      
      // Small extra: show a subtle welcome popup hint? not necessary.
      // Make sure body overflow reset if modal was left open by any weirdness
      document.body.style.overflow = '';
      
      // Add a little style to make hero area interactive feedback
      const heroMsg = document.querySelector('.hero-static p');
      if (heroMsg) {
        heroMsg.style.transition = 'all 0.2s';
      }
    });
  </script>




















<section class="login-content">

<div class="login-box">

<form class="login-form app_frm" 

 style="background-image: url('imagesh/back.jpg');
       background-size: cover;
       background-position: center;
       background-repeat: no-repeat !important;"

        action="core/auth" autocomplete="OFF" method="POST">
<center>
    <img 
        height="140" 
        src="images/logo/<?php echo WBLogo; ?>" 
        style="border-radius: 50%; object-fit: cover;"
        alt="Logo">
</center>
<h1 class="login-head"><?php echo WBName; ?></h1>
<h3 class="text-center" >ELIMU SCHOOL MANAGEMENT SYSTEM</h3>
<div class="mb-3">
<label class="form-label" style="color: rgb(255, 0, 111);">USERNAME</label>
<input class="form-control" type="text" placeholder="Email or Registration Number" required name="username">
</div>
<div class="mb-3">
<label class="form-label" style="color: rgb(255, 0, 0);">PASSWORD</label>
<input class="form-control" type="password" placeholder="Login Password" required name="password">
</div>
<div class="mb-3">
<div class="utility">
<p class="semibold-text mb-2"><a href="javascript:void(0);" data-toggle="flip">Forgot Password ?</a></p>
</div>
</div>
<div class="mb-3 btn-container d-grid">
<button type="submit" class="btn btn-primary btn-block app_btn"><i class="bi bi-box-arrow-in-right me-2 fs-5"></i>SIGN IN</button>
</div>
</form>

<form class="forget-form app_frm" action="core/forgot_pw" method="POST" autocomplete="OFF">
<center><img height="140" src="images/logo/<?php echo WBLogo; ?>"></center>
<h4 class="login-head"><?php echo WBName; ?></h4>
<p class="text-center"> ELIMU SCHOOL MANAGEMENT SYSTEM</p>
<div class="mb-3">
<label class="form-label">USERNAME</label>
<input class="form-control" type="text" placeholder="Email or Registration Number" required name="username">
</div>
<div class="mb-3 btn-container d-grid">
<button type="submit" class="btn btn-primary btn-block app_btn"><i class="bi bi-unlock me-2 fs-5"></i>RESET PASSWORD</button>
</div>
<div class="mb-3 mt-3">
<p class="semibold-text mb-0"><a href="javascript:void(0);" data-toggle="flip"><i class="bi bi-chevron-left me-1"></i> Back to Login</a></p>
</div>
</form>
</div>
</section>

<script src="js/jquery-3.7.0.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/main.js"></script>
<script src="loader/waitMe.js"></script>
<script src="js/forms.js"></script>
<script src="js/sweetalert2@11.js"></script>
<script type="text/javascript">
$('.login-content [data-toggle="flip"]').click(function() {
$('.login-box').toggleClass('flipped');
return false;
});
</script>
<?php require_once('const/check-reply.php'); ?>

 <footer>
    <p>© 2026 Elimu School — Excellence in Education. All content opens as floating popups, page never reloads.</p>
  </footer>
</body>
</html>
