<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 31/05/2025
  Time: 11:01 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Edit Blog Post</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
</head>
<body class="bg-gray-50 dark:bg-gray-900 min-h-screen text-gray-900 dark:text-white">

<!-- Header -->
<div class="bg-white dark:bg-gray-800 shadow-sm border-b border-gray-200 dark:border-gray-700">
  <div class="container mx-auto px-4 py-6 flex flex-col sm:flex-row justify-between items-center">
    <h1 class="text-3xl font-bold flex items-center mb-4 sm:mb-0">
      <i class="fas fa-edit text-indigo-600 mr-3"></i>
      Edit Blog
    </h1>
    <div class="flex space-x-3">
      <a href="/blogs" class="inline-flex items-center px-4 py-2 bg-gray-600 hover:bg-gray-700 text-white font-medium rounded-lg transition duration-200">
        <i class="fas fa-home mr-2"></i> Blog List
      </a>
      <a href="/my-blogs" class="inline-flex items-center px-4 py-2 bg-blue-600 hover:bg-blue-700 text-white font-medium rounded-lg transition duration-200">
        <i class="fas fa-list mr-2"></i> My Blogs
      </a>
    </div>
  </div>
</div>

<!-- Main Content -->
<div class="container mx-auto px-4 py-10">

  <c:if test="${not empty message}">
    <div class="mb-6 p-4 rounded-lg bg-green-50 border border-green-300 text-green-800">
      <i class="fas fa-check-circle mr-2"></i> ${message}
    </div>
  </c:if>
  <c:if test="${not empty error}">
    <div class="mb-6 p-4 rounded-lg bg-red-50 border border-red-300 text-red-800">
      <i class="fas fa-exclamation-circle mr-2"></i> ${error}
    </div>
  </c:if>

  <!-- Blog Form Card -->
  <div class="bg-white dark:bg-gray-800 shadow-md rounded-xl p-8">
    <form method="post" action="/blog/edit" class="space-y-6">


      <input type="hidden" name="id" value="${blog.id}" />

      <div>
        <label for="title" class="block text-sm font-medium mb-1">Title</label>
        <input
                type="text"
                id="title"
                name="title"
                required
                value="${blog.title}"
                placeholder="Enter blog title"
                class="w-full px-4 py-2 border border-gray-300 dark:border-gray-600 bg-white dark:bg-gray-700 text-gray-900 dark:text-white rounded-lg focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500"
        />
      </div>

      <!-- Content -->
      <div>
        <label for="content" class="block text-sm font-medium mb-1">Content</label>
        <textarea
                id="content"
                name="content"
                rows="8"
                required
                placeholder="Write your blog content here..."
                class="w-full px-4 py-2 border border-gray-300 dark:border-gray-600 bg-white dark:bg-gray-700 text-gray-900 dark:text-white rounded-lg focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 resize-y"
        >${blog.content}</textarea>
      </div>

      <!-- Category -->
      <div>
        <label for="category" class="block text-sm font-medium mb-1">Category</label>
        <input
                type="text"
                id="category"
                name="category"
                required
                value="${blog.category}"
                placeholder="e.g. Tech, Life, Food..."
                class="w-full px-4 py-2 border border-gray-300 dark:border-gray-600 bg-white dark:bg-gray-700 text-gray-900 dark:text-white rounded-lg focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500"
        />
      </div>

      <div>
        <button type="submit" class="w-full bg-yellow-500 hover:bg-yellow-600 text-white font-semibold py-3 rounded-lg transition transform hover:scale-105 shadow">
          <i class="fas fa-save mr-2"></i> Update Blog
        </button>
      </div>
    </form>
  </div>
</div>

<!-- Footer -->
<footer class="bg-white dark:bg-gray-800 border-t border-gray-200 dark:border-gray-700 mt-16">
  <div class="container mx-auto px-4 py-8 text-center text-gray-600 dark:text-gray-400">
    <p>&copy; 2025 Blog Platform. Share your thoughts with the world.</p>
  </div>
</footer>

</body>
</html>

