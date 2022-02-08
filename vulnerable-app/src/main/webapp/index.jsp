<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://unpkg.com/tailwindcss@2.2.4/dist/tailwind.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="h-screen flex bg-gray-800 justify-center items-center">
            <div class="max-w-md w-full space-y-8 bg-white p-8 rounded">
                <h2 class="mt-6 text-center text-3xl font-extrabold text-gray-900">Sign in to your account</h2>
                <form class="mt-8 space-y-6" method="POST" action="/login">

                    <div class="flex items-center border-2 py-2 px-3 rounded shadow-sm mb-4 border-gray-300">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 12a4 4 0 10-8 0 4 4 0 008 0zm0 0v1.5a2.5 2.5 0 005 0V12a9 9 0 10-9 9m4.5-1.206a8.959 8.959 0 01-4.5 1.207" />
                        </svg>
                        <input class="pl-2 outline-none border-none" type="text" name="uname" placeholder="Username" />
                    </div>

                    <div class="flex items-center border-2 py-2 px-3 shadow-sm rounded border-gray-300">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-gray-400" viewBox="0 0 20 20" fill="currentColor">
                            <path fill-rule="evenodd" d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z" clip-rule="evenodd" />
                        </svg>
                        <input class="pl-2 outline-none border-none" type="text" name="password" placeholder="Password" />
                    </div>
            
                    <div class="flex items-center justify-between">
                        <div class="flex items-center">
                            <input id="remember-me" name="remember-me" type="checkbox" class="h-4 w-4 text-indigo-600 focus:ring-indigo-500 border-gray-300 rounded">
                            <label for="remember-me" class="ml-2 block text-sm text-gray-900"> Remember me </label>
                        </div>
                        <div class="text-sm">
                            <a href="#" class="font-medium text-indigo-600 hover:text-indigo-500"> Forgot your password? </a>
                        </div>
                    </div>
                    <% 
                        if (request.getParameter("errors") !== null) {
                            out.print("<h2 class='mt-6 text-center text-xl font-bold text-red-600'>Login failed: wrong user credentials</h2>");
                        }
                    %> 
                    <button type="submit" class="group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">Sign in</button>
                </form>
            </div>
        </div>
    </body>
</html>