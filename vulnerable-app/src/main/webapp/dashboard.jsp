<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://unpkg.com/tailwindcss@2.2.4/dist/tailwind.min.css" rel="stylesheet">
    </head>
    <body class="bg-gray-800 font-sans leading-normal tracking-normal">
        <header>
            <nav aria-label="menu nav" class="bg-gray-800 pt-2 md:pt-1 pb-1 px-1 mt-0 h-auto fixed w-full z-20 top-0">
                <div class="flex flex-wrap items-center">
                    <div class="flex flex-shrink md:w-1/3 justify-center md:justify-start text-white">
                        <a href="#" aria-label="Home">
                            <span class="pl-3 text-3xl font-extrabold">Company</span>
                        </a>
                    </div>
                    <div class="flex flex-1 md:w-1/3 justify-center md:justify-start text-white px-2">
                        <span class="relative w-full">
                            <input aria-label="search" type="search" id="search" placeholder="Search" class="w-full bg-gray-900 text-white transition border border-transparent focus:outline-none focus:border-gray-400 rounded py-3 px-2 pl-10 appearance-none leading-normal">
                            <div class="absolute search-icon" style="top: 1rem; left: .8rem;">
                                <svg class="fill-current pointer-events-none text-white w-4 h-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
                                    <path d="M12.9 14.32a8 8 0 1 1 1.41-1.41l5.35 5.33-1.42 1.42-5.33-5.34zM8 14A6 6 0 1 0 8 2a6 6 0 0 0 0 12z"></path>
                                </svg>
                            </div>
                        </span>
                    </div>
                    <div class="flex w-full pt-2 content-center justify-between md:w-1/3 md:justify-end">
                        <ul class="list-reset flex justify-between flex-1 md:flex-none items-center">
                            <li class="flex-1 md:flex-none md:mr-3">
                                <div class="relative inline-block">
                                    <button  class="drop-button text-white py-2 px-2"> 
                                        Hi, <% out.print(request.getParameter("uname")); %> 
                                    </button>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>
        <main>
            <div class="flex flex-col md:flex-row">
                <nav aria-label="alternative nav">
                    <div class="bg-gray-800 shadow-xl h-20 fixed bottom-0 md:relative md:h-screen z-10 w-full md:w-48 content-center">
                        <div class="md:mt-12 md:w-48 md:fixed md:left-0 md:top-0 content-center md:content-start text-left justify-between">
                            <ul class="list-reset flex flex-row md:flex-col pt-3 md:py-3 px-1 md:px-2 text-center md:text-left">
                                <li class="mr-3 flex-1">
                                    <a href="#" class="block py-1 md:py-3 pl-1 align-middle text-white no-underline hover:text-white border-b-2 border-blue-600">
                                        <i class="fas fa-chart-area pr-0 md:pr-3 text-blue-600"></i><span class="pb-1 md:pb-0 text-xs md:text-base text-white md:text-white block md:inline-block">Dashboard</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
                <section class="flex flex-1">
                    <div id="main" class="main-content flex-1 bg-gray-100 mt-12 pb-24 md:pb-5">
                        <div class="bg-gray-800 pt-3">
                            <div class="rounded-tl-3xl bg-gradient-to-r from-blue-900 to-gray-800 p-4 shadow text-2xl text-white">
                                <h1 class="font-bold pl-2">Dashboard</h1>
                            </div>
                        </div>

                        <div class="flex justify-center items-center mt-12 text-3xl font-extrabold text-gray-900">
                            Welcome <% out.print(request.getParameter("uname")); %> 
                        </div>
                    </div>
                </section>
            </div>
        </main>
    </body>
</html>