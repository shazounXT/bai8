<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Thanks</title>
  <!-- dùng đường dẫn tuyệt đối theo context cho chắc chắn -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css" />
</head>
<body class="has-hero">
  <!-- nền -->
  <div class="hero-bg"></div>
  <div class="hero-overlay"></div>

  <main class="hero-center">
    <section class="glass">
      <h1 class="page-title">Thanks for joining our email list</h1>

      <div class="glass-section">
        <h2>Here is the information that you entered:</h2>
        <p><strong>Email:</strong> ${email}</p>
        <p><strong>First Name:</strong> ${firstName}</p>
        <p><strong>Last Name:</strong> ${lastName}</p>
      </div>

      <div class="glass-section">
        <h2>Extra Information:</h2>
        <p><strong>Current Year:</strong> ${currentDate}</p>
        <p><strong>First User Email:</strong> ${firstUserEmail}</p>
        <p><strong>Second User Email:</strong> ${secondUserEmail}</p>
        <p><strong>Customer Service Email:</strong> ${customerServiceEmail}</p>
      </div>

      <a class="btn" href="${pageContext.request.contextPath}/index.jsp">Return</a>
    </section>
  </main>
</body>
</html>
