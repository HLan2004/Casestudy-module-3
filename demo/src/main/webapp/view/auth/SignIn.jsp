<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 27/05/2025
  Time: 8:10 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sign In</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 dark:bg-gray-900 min-h-screen flex items-center justify-center">
<section class="bg-white dark:bg-gray-900">
    <div class="container flex items-center justify-center min-h-screen px-6 mx-auto">
        <form action="/auth/signIn" method="post" class="w-full max-w-md">

            <% if (request.getAttribute("error") != null) { %>
            <div class="text-red-500 text-center mb-4">
                <%= request.getAttribute("error") %>
            </div>
            <% } %>


            <div class="flex justify-center mx-auto">
                <img class="w-auto h-7 sm:h-8" src="https://merakiui.com/images/logo.svg" alt="">
            </div>

            <div class="flex items-center justify-center mt-6">
                <a href="/auth/signIn" class="w-1/3 pb-4 font-medium text-center text-gray-800 capitalize border-b-2 border-blue-500 dark:border-blue-400 dark:text-white">
                    sign in
                </a>

                <a href="/auth/signUp" class="w-1/3 pb-4 font-medium text-center text-gray-500 capitalize border-b dark:border-gray-400 dark:text-gray-300">
                    sign up
                </a>
            </div>

            <div class="relative flex items-center mt-8">
                <span class="absolute">
                      <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6 mx-3 text-gray-300 dark:text-gray-500" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />
                      </svg>
                </span>

                <input type="email" name="email" class="block w-full py-3 text-gray-700 bg-white border rounded-lg px-11 dark:bg-gray-900 dark:text-gray-300 dark:border-gray-600 focus:border-blue-400 dark:focus:border-blue-300 focus:ring-blue-300 focus:outline-none focus:ring focus:ring-opacity-40" placeholder="Email address">
            </div>

            <div class="relative flex items-center mt-4">
                <span class="absolute">
                      <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6 mx-3 text-gray-300 dark:text-gray-500" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z"></path>
                      </svg>
                </span>

                <input type="password" name="password" class="block w-full px-10 py-3 text-gray-700 bg-white border rounded-lg dark:bg-gray-900 dark:text-gray-300 dark:border-gray-600 focus:border-blue-400 dark:focus:border-blue-300 focus:ring-blue-300 focus:outline-none focus:ring focus:ring-opacity-40" placeholder="Password">
            </div>

            <div class="mt-6">
                <button type="submit" class="w-full px-6 py-3 text-sm font-medium tracking-wide text-white capitalize transition-colors duration-300 transform bg-blue-500 rounded-lg hover:bg-blue-400 focus:outline-none focus:ring focus:ring-blue-300 focus:ring-opacity-50">
                    Sign In
                </button>

                <div class="mt-6 text-center ">
                    <a href="/auth/signUp" class="text-sm text-blue-500 hover:underline dark:text-blue-400">
                        Create a new account
                    </a>
                </div>
            </div>
        </form>
    </div>
</section>
</body>
</html>
