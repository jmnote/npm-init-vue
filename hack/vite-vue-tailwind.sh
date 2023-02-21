#!/bin/bash
cd $(dirname $0)/../
PROJECT=vite-vue-tailwind

rm -rf $PROJECT
npm create vite@latest $PROJECT -- --template vue
cd $PROJECT

npm install -D tailwindcss postcss autoprefixer
npx tailwindcss init -p

mv tailwind.config.cjs tailwind.config.orig.cjs
cat <<EOF > tailwind.config.cjs
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./index.html",
    "./src/**/*.{vue,js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}
EOF

cd src/
mv style.css style.orig.css
cat <<EOF > style.css
@tailwind base;
@tailwind components;
@tailwind utilities;
EOF

mv App.vue App.orig.vue
cat <<EOF > App.vue
<template>
  <h1 class="text-3xl font-bold underline">
    Hello world!
  </h1>
</template>
EOF

