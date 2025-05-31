<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 31/05/2025
  Time: 11:13 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="blog" value="${requestScope['blog']}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Blog Details</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50 dark:bg-gray-900 min-h-screen">
<!-- Header Section -->
<div class="bg-white dark:bg-gray-800 shadow-sm border-b border-gray-200 dark:border-gray-700">
    <div class="container mx-auto px-4 py-6">
        <div class="flex flex-col sm:flex-row sm:items-center sm:justify-between">
            <div>
                <h1 class="text-3xl font-bold text-gray-900 dark:text-white">Blog Detail</h1>
                <p class="mt-1 text-gray-600 dark:text-gray-400">Reading amazing content from our community</p>
            </div>
            <div class="mt-4 sm:mt-0">
                <a href="/blogs" class="inline-flex items-center px-4 py-2 bg-blue-600 hover:bg-blue-700 text-white font-medium rounded-lg transition duration-200">
                    <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7"></path>
                    </svg>
                    Back
                </a>
            </div>
        </div>
    </div>
</div>

<!-- Main Content -->
<div class="container mx-auto px-4 py-8">
    <c:choose>
        <c:when test="${empty blog}">
            <!-- Empty State -->
            <div class="text-center py-16">
                <svg class="mx-auto h-16 w-16 text-gray-400 dark:text-gray-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1" d="M19 20H5a2 2 0 01-2-2V6a2 2 0 012-2h10a2 2 0 012 2v1m2 13a2 2 0 01-2-2V7m2 13a2 2 0 002-2V9a2 2 0 00-2-2h-2m-4-3H9M7 16h6M7 8h6v4H7V8z"></path>
                </svg>
                <h3 class="mt-4 text-lg font-medium text-gray-900 dark:text-white">Blog not found</h3>
                <p class="mt-2 text-gray-500 dark:text-gray-400">The blog you're looking for doesn't exist or has been removed.</p>
                <div class="mt-6">
                    <a href="/blogs" class="inline-flex items-center px-4 py-2 bg-blue-600 hover:bg-blue-700 text-white font-medium rounded-lg transition duration-200">
                        Back to Blog List
                    </a>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <!-- Blog Detail Article -->
            <article class="max-w-4xl mx-auto">
                <!-- Blog Header -->
                <div class="bg-white dark:bg-gray-800 rounded-lg shadow-md overflow-hidden">
                    <!-- Blog Image Placeholder -->
                    <div class="h-64 bg-gradient-to-br from-blue-500 to-purple-600 relative">
                        <div class="absolute inset-0 bg-black bg-opacity-20 flex items-center justify-center">
                            <svg class="w-16 h-16 text-white opacity-70" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 20H5a2 2 0 01-2-2V6a2 2 0 012-2h10a2 2 0 012 2v1m2 13a2 2 0 01-2-2V7m2 13a2 2 0 002-2V9a2 2 0 00-2-2h-2m-4-3H9M7 16h6M7 8h6v4H7V8z"></path>
                            </svg>
                        </div>
                    </div>

                    <!-- Blog Content -->
                    <div class="p-8">
                        <!-- Blog Title -->
                        <h1 class="text-3xl font-bold text-gray-900 dark:text-white mb-6">
                                ${blog.title}
                        </h1>

                        <!-- Blog Meta Information -->
                        <div class="flex flex-wrap items-center gap-6 mb-8 pb-6 border-b border-gray-200 dark:border-gray-700">
                            <!-- Author Info -->
                            <div class="flex items-center">
                                <div class="flex-shrink-0">
                                    <div class="w-10 h-10 bg-gray-300 dark:bg-gray-600 rounded-full flex items-center justify-center">
                                        <svg class="w-5 h-5 text-gray-600 dark:text-gray-300" fill="currentColor" viewBox="0 0 20 20">
                                            <path fill-rule="evenodd" d="M10 9a3 3 0 100-6 3 3 0 000 6zm-7 9a7 7 0 1114 0H3z" clip-rule="evenodd"></path>
                                        </svg>
                                    </div>
                                </div>
                                <div class="ml-3">
                                    <p class="text-sm font-medium text-gray-900 dark:text-white">${blog.author}</p>
                                    <p class="text-xs text-gray-500 dark:text-gray-400">
                                        Author
                                    </p>
                                </div>
                            </div>

                            <!-- Date -->
                            <div class="flex items-center text-gray-600 dark:text-gray-400">
                                <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"></path>
                                </svg>
                                <span class="text-sm">
                                        <strong>Created Date:</strong> ${blog.createdAt}
                                    </span>
                            </div>

                            <!-- Category -->
                            <div class="flex items-center">
                                <svg class="w-5 h-5 mr-2 text-gray-600 dark:text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 7h.01M7 3h5c.512 0 1.024.195 1.414.586l7 7a2 2 0 010 2.828l-7 7a2 2 0 01-2.828 0l-7-7A1.99 1.99 0 013 12V7a4 4 0 014-4z"></path>
                                </svg>
                                <span class="inline-flex items-center px-3 py-1 rounded-full text-xs font-medium bg-blue-100 text-blue-800 dark:bg-blue-900 dark:text-blue-200">
                                        ${blog.category}
                                </span>
                            </div>
                        </div>

                        <!-- Blog Content -->
                        <div class="text-gray-700 dark:text-gray-300 leading-relaxed prose prose-lg dark:prose-invert">
                            <c:out value="${blog.content}" escapeXml="false"/>
                        </div>

                        <!-- Action Buttons -->
                        <div class="flex items-center justify-between mt-8 pt-6 border-t border-gray-200 dark:border-gray-700">
                            <a href="/blogs" class="inline-flex items-center px-4 py-2 bg-gray-600 hover:bg-gray-700 text-white font-medium rounded-lg transition duration-200">
                                <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7"></path>
                                </svg>
                                Back to List
                            </a>

                            <!-- Share Button -->
                            <button class="inline-flex items-center px-4 py-2 border border-gray-300 dark:border-gray-600 text-gray-700 dark:text-gray-300 bg-white dark:bg-gray-800 hover:bg-gray-50 dark:hover:bg-gray-700 font-medium rounded-lg transition duration-200">
                                <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8.684 13.342C8.886 12.938 9 12.482 9 12c0-.482-.114-.938-.316-1.342m0 2.684a3 3 0 110-2.684m0 2.684l6.632 3.316m-6.632-6l6.632-3.316m0 0a3 3 0 105.367-2.684 3 3 0 00-5.367 2.684zm0 9.316a3 3 0 105.367 2.684 3 3 0 00-5.367-2.684z"></path>
                                </svg>
                                Share
                            </button>
                        </div>
                    </div>
                </div>
            </article>
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
</body>
</html>