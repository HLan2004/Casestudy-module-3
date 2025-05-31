<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 31/05/2025
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Admin - Blog Management</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50 dark:bg-gray-900 flex flex-col min-h-screen">

<!-- Header / Navbar -->
<header class="bg-white dark:bg-gray-800 shadow">
  <div class="container mx-auto px-4 py-6 flex justify-between items-center">
    <h1 class="text-2xl font-semibold text-gray-900 dark:text-white">Admin Dashboard</h1>
    <nav class="space-x-6">
      <a href="/admin/blog/list"
         class="text-blue-600 hover:text-blue-800 dark:text-blue-400 dark:hover:text-blue-300 font-medium">Manage Blogs</a>
      <a href="/admin/user/list"
         class="text-gray-500 hover:text-gray-700 dark:text-gray-400 dark:hover:text-gray-200 font-medium">Manage Users</a>
      <a href="/auth/logout"
         class="text-red-600 hover:text-red-800 dark:text-red-400 dark:hover:text-red-600 font-medium">Logout</a>
    </nav>
  </div>
</header>

<main class="container mx-auto px-4 py-8 flex-grow">
  <section>
    <div class="mb-4">
      <h2 class="text-xl font-semibold text-gray-900 dark:text-white">Blog Management</h2>
    </div>

    <div class="bg-white dark:bg-gray-800 shadow rounded-lg">
      <table class="w-full table-auto divide-y divide-gray-200 dark:divide-gray-700">
        <thead class="bg-gray-800 dark:bg-gray-700 border-b-2 border-gray-600">
        <tr>
          <th class="px-6 py-3 text-left text-xs font-semibold text-gray-400 dark:text-gray-300 uppercase tracking-wider">ID</th>
          <th class="px-6 py-3 text-left text-xs font-semibold text-gray-400 dark:text-gray-300 uppercase tracking-wider">Title</th>
          <th class="px-6 py-3 text-left text-xs font-semibold text-gray-400 dark:text-gray-300 uppercase tracking-wider">Author</th>
          <th class="px-6 py-3 text-left text-xs font-semibold text-gray-400 dark:text-gray-300 uppercase tracking-wider">Created At</th>
          <th class="px-6 py-3 text-left text-xs font-semibold text-gray-400 dark:text-gray-300 uppercase tracking-wider">Category</th>
          <th class="px-6 py-3 text-center text-xs font-semibold text-gray-400 dark:text-gray-300 uppercase tracking-wider">Actions</th>
        </tr>
        </thead>
        <tbody class="divide-y divide-gray-200 dark:divide-gray-700">
        <c:forEach var="b" items="${requestScope.blogs}" varStatus="status">
          <tr class="${status.index % 2 == 0 ? 'bg-white dark:bg-gray-700' : 'bg-gray-50 dark:bg-gray-800'}">
            <td class="px-6 py-4 text-sm text-gray-900 dark:text-gray-300 break-words">${b.id}</td>
            <td class="px-6 py-4 text-sm text-gray-900 dark:text-gray-300 break-words">${b.title}</td>
            <td class="px-6 py-4 text-sm text-gray-900 dark:text-gray-300 break-words">${b.author}</td>
            <td class="px-6 py-4 text-sm text-gray-500 dark:text-gray-400 break-words">${b.createdAt}</td>
            <td class="px-6 py-4 text-sm text-gray-900 dark:text-gray-300 break-words">${b.category}</td>
            <td class="px-6 py-4 text-center text-sm font-medium">
              <form action="/admin/blog/delete" method="post" class="inline">
                <input type="hidden" name="id" value="${b.id}"/>
                <button type="submit"
                        class="inline-flex items-center px-3 py-1 bg-red-600 hover:bg-red-700 dark:bg-red-500 dark:hover:bg-red-600 text-white text-xs font-medium rounded transition"
                        onclick="return confirm('Are you sure you want to delete this blog?');">
                  Delete
                </button>
              </form>
            </td>
          </tr>
        </c:forEach>

        <c:if test="${empty requestScope.blogs}">
          <tr>
            <td colspan="7" class="px-6 py-4 text-center text-sm text-gray-600 dark:text-gray-400">No blogs found.</td>
          </tr>
        </c:if>
        </tbody>
      </table>
    </div>

  </section>
</main>

<!-- Footer -->
<footer class="bg-white dark:bg-gray-800 shadow-inner text-center text-gray-600 dark:text-gray-400 py-4">
  &copy; 2025 Blog Platform. All rights reserved.
</footer>
</body>
</html>
