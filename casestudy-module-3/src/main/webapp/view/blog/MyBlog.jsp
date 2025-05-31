<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 31/05/2025
  Time: 11:14 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="myBlogs" value="${requestScope['myBlogs']}" />
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>My Blogs</title>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50 dark:bg-gray-900">
<div class="flex flex-col min-h-screen">
  <!-- Header -->
  <div class="bg-white dark:bg-gray-800 shadow-sm border-b border-gray-200 dark:border-gray-700">
    <div class="container mx-auto px-4 py-6">
      <div class="flex flex-col sm:flex-row sm:items-center sm:justify-between">
        <div>
          <h1 class="text-3xl font-bold text-gray-900 dark:text-white">My Blogs</h1>
          <p class="mt-1 text-gray-600 dark:text-gray-400">Manage the blog posts you've created</p>
        </div>
        <div class="mt-4 sm:mt-0 flex space-x-3">
          <a href="/blogs" class="inline-flex items-center px-4 py-2 bg-gray-600 hover:bg-gray-700 text-white font-medium rounded-lg transition duration-200">
            <i class="fas fa-home mr-2"></i> Blog List
          </a>
          <a href="/blog/create" class="inline-flex items-center px-4 py-2 bg-blue-600 hover:bg-blue-700 text-white font-medium rounded-lg transition duration-200">
            <i class="fas fa-plus mr-2"></i> Create New Post
          </a>
          <a href="/auth/logout" class="inline-flex items-center px-4 py-2 bg-red-600 hover:bg-red-700 text-white font-medium rounded-lg transition duration-200">
            <i class="fas fa-sign-out-alt mr-2"></i> Logout
          </a>
        </div>
      </div>
    </div>
  </div>


  <!-- Main Content -->
  <div class="flex-grow container mx-auto px-4 py-8">
    <form method="get" action="" class="mb-8 flex flex-wrap items-center gap-4">
      <input
              type="text"
              name="keyword"
              placeholder="Search blogs..."
              value="${param.keyword}"
              class="flex-grow min-w-[200px] px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-600 dark:bg-gray-700 dark:border-gray-600 dark:text-white"
      />

      <label class="inline-flex items-center space-x-2 text-gray-700 dark:text-gray-300 cursor-pointer select-none">
        <input
                type="checkbox"
                name="searchByCategory"
                value="true"
                <c:if test="${param.searchByCategory eq 'true'}">checked</c:if>
                class="form-checkbox h-5 w-5 text-blue-600"
        />
        <span>Category</span>
      </label>

      <button
              type="submit"
              class="inline-flex items-center px-5 py-2 bg-blue-600 hover:bg-blue-700 text-white font-medium rounded-lg transition duration-200"
      >
        <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24" >
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"/>
        </svg>
        Search
      </button>
    </form>


    <c:choose>
      <c:when test="${empty myBlogs}">
        <div class="text-center py-16">
          <svg class="mx-auto h-16 w-16 text-gray-400 dark:text-gray-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1" d="M7 16h6M7 8h6v4H7V8z"></path>
          </svg>
          <h3 class="mt-4 text-lg font-medium text-gray-900 dark:text-white">You haven't created any posts</h3>
          <p class="mt-2 text-gray-500 dark:text-gray-400">Start by writing your first blog post.</p>
          <div class="mt-6">
            <a href="blog/create" class="inline-flex items-center px-4 py-2 bg-blue-600 hover:bg-blue-700 text-white font-medium rounded-lg transition duration-200">
              Write your first post
            </a>
          </div>
        </div>
      </c:when>
      <c:otherwise>
        <div class="grid gap-6 md:grid-cols-2 lg:grid-cols-3">
          <c:forEach var="b" items="${myBlogs}" varStatus="status">
            <article class="bg-white dark:bg-gray-800 rounded-lg shadow-md hover:shadow-lg transition-shadow duration-300 overflow-hidden">
              <!-- Blog Image Placeholder -->
              <div class="h-48 bg-gradient-to-br from-green-500 to-teal-600 relative">
                <div class="absolute inset-0 bg-black bg-opacity-20 flex items-center justify-center">
                  <svg class="w-12 h-12 text-white opacity-70" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 20H5a2 2 0 01-2-2V6a2 2 0 012-2h10a2 2 0 012 2v1m2 13a2 2 0 01-2-2V7m2 13a2 2 0 002-2V9a2 2 0 00-2-2h-2m-4-3H9M7 16h6M7 8h6v4H7V8z"></path>
                  </svg>
                </div>
                <span class="absolute top-4 left-4 bg-white bg-opacity-90 text-gray-800 text-xs font-semibold px-2 py-1 rounded-full">
                  #${status.index + 1}
                </span>
              </div>

              <!-- Blog Content -->
              <div class="p-6">
                <h3 class="text-lg font-semibold text-gray-900 dark:text-white mb-2 line-clamp-2">
                    ${b.title}
                </h3>
                <p class="text-sm text-gray-500 dark:text-gray-400 mb-4">${b.category} - ${b.createdAt}</p>

                <div class="flex justify-between items-center">
                  <a href="/blog/detail?id=${b.id}" class="text-blue-600 hover:text-blue-800 dark:text-blue-400 dark:hover:text-blue-300 text-sm font-medium flex items-center">
                    View
                    <svg class="w-4 h-4 ml-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"></path>
                    </svg>
                  </a>

                  <div class="flex items-center space-x-4">
                    <a href="/blog/edit?id=${b.id}" class="text-yellow-500 hover:text-yellow-700 text-sm font-medium">
                      Edit
                    </a>

                    <a href="/blog/delete?id=${b.id}" onclick="return confirm('Are you sure you want to delete this post?')" class="text-red-500 hover:text-red-700 text-sm font-medium">
                      Delete
                    </a>
                  </div>
                </div>
              </div>
            </article>
          </c:forEach>
        </div>
      </c:otherwise>
    </c:choose>
  </div>

  <!-- Footer -->
  <footer class="bg-white dark:bg-gray-800 border-t border-gray-200 dark:border-gray-700">
    <div class="container mx-auto px-4 py-8">
      <div class="text-center text-gray-600 dark:text-gray-400">
        <p>&copy; 2025 Blog Platform. Discover and share amazing content.</p>
      </div>
    </div>
  </footer>

  <style>
    .line-clamp-2 {
      display: -webkit-box;
      -webkit-line-clamp: 2;
      -webkit-box-orient: vertical;
      overflow: hidden;
    }
  </style>
</div>
</body>
</html>



