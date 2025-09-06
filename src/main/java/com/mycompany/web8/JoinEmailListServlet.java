package com.mycompany.web8;

import java.io.IOException;
import java.util.Date;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "JoinEmailListServlet", urlPatterns = {"/submit", "/join"})
public class JoinEmailListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Cho phép mở trực tiếp /join để quay về form
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        // ----- Lấy dữ liệu từ form -----
        String email      = request.getParameter("email");
        String firstName  = request.getParameter("firstName");
        String lastName   = request.getParameter("lastName");
        String dob        = request.getParameter("dob");     // Date of Birth (type=date)
        String hear       = request.getParameter("hear");    // radio: Search engine / Word of mouth / Social Media / Other
        String optInCd    = request.getParameter("optInCd")    != null ? "Yes" : "No";
        String optInEmail = request.getParameter("optInEmail") != null ? "Yes" : "No";
        String contactBy  = request.getParameter("contactBy"); // select

        // ----- Validate nhẹ -----
        boolean invalid = email == null || email.isBlank()
                       || firstName == null || firstName.isBlank()
                       || lastName  == null || lastName.isBlank()
                       || dob       == null || dob.isBlank()
                       || hear      == null
                       || contactBy == null;

        if (invalid) {
            request.setAttribute("error", "Please complete all required fields.");

            // Giữ lại dữ liệu đã nhập để user không phải gõ lại
            request.setAttribute("email", email);
            request.setAttribute("firstName", firstName);
            request.setAttribute("lastName", lastName);
            request.setAttribute("dob", dob);

            request.getRequestDispatcher("index.jsp").forward(request, response);
            return;
        }

        // ----- Gắn attribute cho trang kết quả (thanks.jsp / result.jsp) -----
        request.setAttribute("email", email);
        request.setAttribute("firstName", firstName);
        request.setAttribute("lastName", lastName);
        request.setAttribute("dob", dob);
        request.setAttribute("hear", hear);
        request.setAttribute("optInCd", optInCd);
        request.setAttribute("optInEmail", optInEmail);
        request.setAttribute("contactBy", contactBy);

        // “Extra Information” giống screenshot trước
        request.setAttribute("currentDate", new Date());
        request.setAttribute("firstUserEmail", "letrivien500@gmail.com");
        request.setAttribute("secondUserEmail", email);
        request.setAttribute("customerServiceEmail", "custserv@murach.com");

        request.getRequestDispatcher("/thanks.jsp").forward(request, response);

    }
}
