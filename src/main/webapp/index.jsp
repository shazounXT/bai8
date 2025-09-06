<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Survey</title>
  <link rel="stylesheet" href="style.css" />
</head>
<body>
  <main class="container">
  <form class="card" action="${pageContext.request.contextPath}/submit" method="post">
      <h1>Survey</h1>

      <h2>Your information:</h2>
      <div class="field-grid">
        <label for="firstName">First Name</label>
        <input id="firstName" name="firstName" type="text"
               value="<%= request.getAttribute("firstName") == null ? "" : request.getAttribute("firstName") %>"
               required />

        <label for="lastName">Last Name</label>
        <input id="lastName" name="lastName" type="text"
               value="<%= request.getAttribute("lastName") == null ? "" : request.getAttribute("lastName") %>"
               required />

        <label for="email">Email</label>
        <input id="email" name="email" type="email"
               value="<%= request.getAttribute("email") == null ? "" : request.getAttribute("email") %>"
               required />

        <label for="dob">Date of Birth</label>
        <input id="dob" name="dob" type="date"
               value="<%= request.getAttribute("dob") == null ? "" : request.getAttribute("dob") %>"
               required />
      </div>

      <h2>How did you hear about us?</h2>
      <fieldset class="options" aria-labelledby="howLabel">
        <legend id="howLabel" class="sr-only">How did you hear about us?</legend>
        <label><input type="radio" name="hear" value="Search engine" required /> Search engine</label>
        <label><input type="radio" name="hear" value="Word of mouth" /> Word of mouth</label>
        <label><input type="radio" name="hear" value="Social Media" /> Social Media</label>
        <label><input type="radio" name="hear" value="Other" /> Other</label>
      </fieldset>

      <h2>Would you like to receive announcements<br>about new CDs and special offers?</h2>
      <div class="stack">
        <label><input type="checkbox" name="optInCd" value="yes" /> YES, I’d like that.</label>
        <label><input type="checkbox" name="optInEmail" value="yes" /> YES, please send me email announcements.</label>
      </div>

      <div class="select-row">
        <label for="contactBy">Please contact me by:</label>
        <select id="contactBy" name="contactBy" required>
          <option value="Email or postal mail">Email or postal mail</option>
          <option value="Email">Email</option>
          <option value="Phone">Phone</option>
          <option value="Postal mail">Postal mail</option>
        </select>
      </div>

      <div class="actions">
        <button type="submit">Submit</button>
      </div>

      <%
        String err = (String) request.getAttribute("error");
        if (err != null) { out.print("<p class='error'>" + err + "</p>"); }
      %>
    </form>
  </main>
</body>
</html>
