<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="blogs" value="${requestScope['blogs']}"/>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Public Blog List</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50 dark:bg-gray-900 min-h-screen">
<!-- Header Section -->
<div class="bg-white dark:bg-gray-800 shadow-sm border-b border-gray-200 dark:border-gray-700">
  <div class="container mx-auto px-4 py-6">
    <div class="flex flex-col sm:flex-row sm:items-center sm:justify-between">
      <div>
        <h1 class="text-3xl font-bold text-gray-900 dark:text-white">Public Blogs</h1>
        <p class="mt-1 text-gray-600 dark:text-gray-400">Discover amazing content from our community</p>
      </div>
      <div class="mt-4 sm:mt-0 flex space-x-4">
        <a href="/my-blogs" class="inline-flex items-center px-4 py-2 bg-blue-600 hover:bg-blue-700 text-white font-medium rounded-lg transition duration-200">
          <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"></path>
          </svg>
          My Blogs
        </a>

        <a href="/blog/create" class="inline-flex items-center px-4 py-2 bg-blue-600 hover:bg-blue-700 text-white font-medium rounded-lg transition duration-200">
          <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"></path>
          </svg>
          Create New Post
        </a>

        <a href="/auth/logout" class="inline-flex items-center px-4 py-2 bg-red-600 hover:bg-red-700 text-white font-medium rounded-lg transition duration-200">
          <!-- Logout icon -->
          <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a2 2 0 01-2 2H7a2 2 0 01-2-2V7a2 2 0 012-2h4a2 2 0 012 2v1"></path>
          </svg>
          Logout
        </a>
      </div>

    </div>
  </div>
</div>

<!-- Main Content -->
<div class="container mx-auto px-4 py-8">
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
    <c:when test="${empty blogs}">
      <div class="text-center py-16">
        <svg class="mx-auto h-16 w-16 text-gray-400 dark:text-gray-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1" d="M19 20H5a2 2 0 01-2-2V6a2 2 0 012-2h10a2 2 0 012 2v1m2 13a2 2 0 01-2-2V7m2 13a2 2 0 002-2V9a2 2 0 00-2-2h-2m-4-3H9M7 16h6M7 8h6v4H7V8z"></path>
        </svg>
        <h3 class="mt-4 text-lg font-medium text-gray-900 dark:text-white">No blogs available</h3>
        <p class="mt-2 text-gray-500 dark:text-gray-400">Get started by creating your first blog post.</p>
        <div class="mt-6">
          <a href="blog/create" class="inline-flex items-center px-4 py-2 bg-blue-600 hover:bg-blue-700 text-white font-medium rounded-lg transition duration-200">
            Create Your First Post
          </a>
        </div>
      </div>
    </c:when>
    <c:otherwise>
      <!-- Blog Grid -->
      <div class="grid gap-6 md:grid-cols-2 lg:grid-cols-3">
        <c:forEach var="b" items="${blogs}" varStatus="status">
          <article class="bg-white dark:bg-gray-800 rounded-lg shadow-md hover:shadow-lg transition-shadow duration-300 overflow-hidden">
            <div class="h-48 bg-gradient-to-br from-blue-500 to-purple-600 relative">
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
              <div class="flex items-center mb-3">
                <div class="flex-shrink-0">
                  <div class="w-8 h-8 bg-gray-300 dark:bg-gray-600 rounded-full flex items-center justify-center">
                    <svg class="w-4 h-4 text-gray-600 dark:text-gray-300" fill="currentColor" viewBox="0 0 20 20">
                      <path fill-rule="evenodd" d="M10 9a3 3 0 100-6 3 3 0 000 6zm-7 9a7 7 0 1114 0H3z" clip-rule="evenodd"></path>
                    </svg>
                  </div>
                </div>
                <div class="ml-3">
                  <p class="text-sm font-medium text-gray-900 dark:text-white">
                      ${b.author}
                  </p>
                  <p class="text-xs text-gray-500 dark:text-gray-400">
                    Author
                  </p>
                </div>
              </div>

              <!-- Blog Title -->
              <h3 class="text-lg font-semibold text-gray-900 dark:text-white mb-3 line-clamp-2">
                  ${b.title}
              </h3>

              <!-- Blog Preview (if content exists) -->
              <c:if test="${not empty b.content}">
                <p class="text-gray-600 dark:text-gray-300 text-sm mb-4 line-clamp-3">
                    ${b.content.length() > 120 ? b.content.substring(0, 120).concat('...') : b.content}
                </p>
              </c:if>

              <!-- Action Button -->
              <div class="flex items-center justify-between">
                <a href="/blog/detail?id=${b.id}"
                   class="inline-flex items-center text-blue-600 hover:text-blue-800 dark:text-blue-400 dark:hover:text-blue-300 font-medium text-sm transition-colors duration-200">
                  Read More
                  <svg class="w-4 h-4 ml-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"></path>
                  </svg>
                </a>
              </div>
            </div>
          </article>
        </c:forEach>
      </div>

      <!-- Load More Section (if needed) -->
      <div class="text-center mt-12">
        <button class="inline-flex items-center px-6 py-3 border border-gray-300 dark:border-gray-600 text-gray-700 dark:text-gray-300 bg-white dark:bg-gray-800 hover:bg-gray-50 dark:hover:bg-gray-700 font-medium rounded-lg transition duration-200">
          <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15"></path>
          </svg>
          Load More Posts
        </button>
      </div>
    </c:otherwise>
  </c:choose>
</div>

<!-- Footer -->
<footer class="bg-white dark:bg-gray-800 border-t border-gray-200 dark:border-gray-700 mt-16">
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
  .line-clamp-3 {
    display: -webkit-box;
    -webkit-line-clamp: 3;
    -webkit-box-orient: vertical;
    overflow: hidden;
  }
</style>
</body>
</html>